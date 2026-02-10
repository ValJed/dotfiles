#!/usr/bin/env python
import subprocess


def remove_line_decoration(line):
    return (
        line.replace("├", "").replace("─", "").replace("│", "").replace("└", "").strip()
    )


# function to parse output of command "wpctl status" and return a dictionary of sinks with their id and name.
def parse_wpctl_status():
    # Execute the wpctl status command and store the output in a variable.
    output = str(subprocess.check_output("wpctl status", shell=True, encoding="utf-8"))

    audio_section = ""

    is_audio_section = False
    for index, line in enumerate(output.splitlines()):
        if not is_audio_section and line.startswith("Audio"):
            is_audio_section = True
        if is_audio_section and line.strip() == "":
            break
        if is_audio_section:
            audio_section += remove_line_decoration(line) + "\n"

    lines = audio_section.splitlines()

    # get the index of the Sinks line as a starting point
    sinks_index = None
    bluez_output = None
    for index, line in enumerate(lines):
        if line.startswith("Sinks:"):
            sinks_index = index
        if " bluez_output." in line:
            bluez_output = line

    if sinks_index == None:
        return []

    # start by getting the lines after "Sinks:" and before the next blank line and store them in a list
    sinks = []
    for line in lines[sinks_index + 1 :]:
        stripped = line.strip()
        if not stripped:
            break
        sinks.append(stripped)

    if bluez_output != None:
        sinks.append(bluez_output.replace("bluez_output", "bluetooth"))

    # remove the "[vol:" from the end of the sink name
    for index, sink in enumerate(sinks):
        sinks[index] = sink.split("[vol:")[0].strip()

    # strip the * from the default sink and instead append "- Default" to the end. Looks neater in the wofi list this way.
    for index, sink in enumerate(sinks):
        if sink.startswith("*"):
            sinks[index] = sink.strip().replace("*", "").strip() + " - Default"

    # make the dictionary in this format {'sink_id': <int>, 'sink_name': <str>}
    sinks_dict = [
        {
            "sink_id": int(sink.split(".")[0]),
            "sink_name": sink.split(".")[1].strip().lower(),
        }
        for sink in sinks
    ]

    return sinks_dict


output = ""
sinks = parse_wpctl_status()
for index, items in enumerate(sinks):
    new_line = "\n"
    if index + 1 == len(sinks):
        new_line = ""
    output += f"{items['sink_name']}{new_line}"

rofi_command = f"echo '{output}' | rofi -dmenu"
rofi_process = subprocess.run(
    rofi_command,
    shell=True,
    encoding="utf-8",
    stdout=subprocess.PIPE,
    stderr=subprocess.PIPE,
)

if rofi_process.returncode != 0:
    exit(0)

selected_sink_name = rofi_process.stdout.strip()
sinks = parse_wpctl_status()
selected_sink = next(sink for sink in sinks if sink["sink_name"] == selected_sink_name)
subprocess.run(f"wpctl set-default {selected_sink['sink_id']}", shell=True)
