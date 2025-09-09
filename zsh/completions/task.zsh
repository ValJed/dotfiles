#compdef task

autoload -U is-at-least

_task() {
    typeset -A opt_args
    typeset -a _arguments_options
    local ret=1

    if is-at-least 5.2; then
        _arguments_options=(-s -S -C)
    else
        _arguments_options=(-s -C)
    fi

    local context curcontext="$curcontext" state line
    _arguments "${_arguments_options[@]}" : \
'--generate=[]:GENERATOR:(bash elvish fish powershell zsh)' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_task_commands" \
"*::: :->task" \
&& ret=0
    case $state in
    (task)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:task-command-$line[1]:"
        case $line[1] in
            (use)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
':name:_default' \
&& ret=0
;;
(up)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
':id:_default' \
':name:_default' \
&& ret=0
;;
(upc)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
':id:_default' \
':name:_default' \
&& ret=0
;;
(ls)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(lsc)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(lsa)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
':name:_default' \
&& ret=0
;;
(done)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
':name:_default' \
&& ret=0
;;
(rm)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
':name:_default' \
&& ret=0
;;
(rmc)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
':name:_default' \
&& ret=0
;;
(clear)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(migrate)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_task__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:task-help-command-$line[1]:"
        case $line[1] in
            (use)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(up)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(upc)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(ls)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(lsc)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(lsa)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(add)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(done)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(rm)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(rmc)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(clear)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(migrate)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
}

(( $+functions[_task_commands] )) ||
_task_commands() {
    local commands; commands=(
'use:uses or creates new context' \
'up:edits task content (takes id of the task then its new content)' \
'upc:edits context name (takes id of the new name)' \
'ls:Shows the list of tasks' \
'lsc:Shows the list of contexts' \
'lsa:shows the list of all tasks from all contexts' \
'add:Created task based on content string' \
'done:Marks one or several tasks (separated by a comma) as done' \
'rm:Deletes one or several tasks (separated by a comma) based on the id' \
'rmc:deletes one or several contexts (separated by a comma) based on the name' \
'clear:Clear all tasks for the active context' \
'migrate:Migrate your data from file to rest API' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'task commands' commands "$@"
}
(( $+functions[_task__add_commands] )) ||
_task__add_commands() {
    local commands; commands=()
    _describe -t commands 'task add commands' commands "$@"
}
(( $+functions[_task__clear_commands] )) ||
_task__clear_commands() {
    local commands; commands=()
    _describe -t commands 'task clear commands' commands "$@"
}
(( $+functions[_task__done_commands] )) ||
_task__done_commands() {
    local commands; commands=()
    _describe -t commands 'task done commands' commands "$@"
}
(( $+functions[_task__help_commands] )) ||
_task__help_commands() {
    local commands; commands=(
'use:uses or creates new context' \
'up:edits task content (takes id of the task then its new content)' \
'upc:edits context name (takes id of the new name)' \
'ls:Shows the list of tasks' \
'lsc:Shows the list of contexts' \
'lsa:shows the list of all tasks from all contexts' \
'add:Created task based on content string' \
'done:Marks one or several tasks (separated by a comma) as done' \
'rm:Deletes one or several tasks (separated by a comma) based on the id' \
'rmc:deletes one or several contexts (separated by a comma) based on the name' \
'clear:Clear all tasks for the active context' \
'migrate:Migrate your data from file to rest API' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'task help commands' commands "$@"
}
(( $+functions[_task__help__add_commands] )) ||
_task__help__add_commands() {
    local commands; commands=()
    _describe -t commands 'task help add commands' commands "$@"
}
(( $+functions[_task__help__clear_commands] )) ||
_task__help__clear_commands() {
    local commands; commands=()
    _describe -t commands 'task help clear commands' commands "$@"
}
(( $+functions[_task__help__done_commands] )) ||
_task__help__done_commands() {
    local commands; commands=()
    _describe -t commands 'task help done commands' commands "$@"
}
(( $+functions[_task__help__help_commands] )) ||
_task__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'task help help commands' commands "$@"
}
(( $+functions[_task__help__ls_commands] )) ||
_task__help__ls_commands() {
    local commands; commands=()
    _describe -t commands 'task help ls commands' commands "$@"
}
(( $+functions[_task__help__lsa_commands] )) ||
_task__help__lsa_commands() {
    local commands; commands=()
    _describe -t commands 'task help lsa commands' commands "$@"
}
(( $+functions[_task__help__lsc_commands] )) ||
_task__help__lsc_commands() {
    local commands; commands=()
    _describe -t commands 'task help lsc commands' commands "$@"
}
(( $+functions[_task__help__migrate_commands] )) ||
_task__help__migrate_commands() {
    local commands; commands=()
    _describe -t commands 'task help migrate commands' commands "$@"
}
(( $+functions[_task__help__rm_commands] )) ||
_task__help__rm_commands() {
    local commands; commands=()
    _describe -t commands 'task help rm commands' commands "$@"
}
(( $+functions[_task__help__rmc_commands] )) ||
_task__help__rmc_commands() {
    local commands; commands=()
    _describe -t commands 'task help rmc commands' commands "$@"
}
(( $+functions[_task__help__up_commands] )) ||
_task__help__up_commands() {
    local commands; commands=()
    _describe -t commands 'task help up commands' commands "$@"
}
(( $+functions[_task__help__upc_commands] )) ||
_task__help__upc_commands() {
    local commands; commands=()
    _describe -t commands 'task help upc commands' commands "$@"
}
(( $+functions[_task__help__use_commands] )) ||
_task__help__use_commands() {
    local commands; commands=()
    _describe -t commands 'task help use commands' commands "$@"
}
(( $+functions[_task__ls_commands] )) ||
_task__ls_commands() {
    local commands; commands=()
    _describe -t commands 'task ls commands' commands "$@"
}
(( $+functions[_task__lsa_commands] )) ||
_task__lsa_commands() {
    local commands; commands=()
    _describe -t commands 'task lsa commands' commands "$@"
}
(( $+functions[_task__lsc_commands] )) ||
_task__lsc_commands() {
    local commands; commands=()
    _describe -t commands 'task lsc commands' commands "$@"
}
(( $+functions[_task__migrate_commands] )) ||
_task__migrate_commands() {
    local commands; commands=()
    _describe -t commands 'task migrate commands' commands "$@"
}
(( $+functions[_task__rm_commands] )) ||
_task__rm_commands() {
    local commands; commands=()
    _describe -t commands 'task rm commands' commands "$@"
}
(( $+functions[_task__rmc_commands] )) ||
_task__rmc_commands() {
    local commands; commands=()
    _describe -t commands 'task rmc commands' commands "$@"
}
(( $+functions[_task__up_commands] )) ||
_task__up_commands() {
    local commands; commands=()
    _describe -t commands 'task up commands' commands "$@"
}
(( $+functions[_task__upc_commands] )) ||
_task__upc_commands() {
    local commands; commands=()
    _describe -t commands 'task upc commands' commands "$@"
}
(( $+functions[_task__use_commands] )) ||
_task__use_commands() {
    local commands; commands=()
    _describe -t commands 'task use commands' commands "$@"
}

if [ "$funcstack[1]" = "_task" ]; then
    _task "$@"
else
    compdef _task task
fi
