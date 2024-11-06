#!/usr/bin/env bash

# Check if a directory path was provided
if [ $# -eq 0 ]; then
    echo "Error: Please provide module to link."
    exit 1
fi

module_name=$1
workspace_path="/home/$USER/Documents/workspace/*"
project_found=false


for dir in $workspace_path; do
  dir_path="$dir/*"

  for project_path in $dir_path; do
    last_part=$(echo $project_path | awk -F/ '{print $NF}')

    if [ "$last_part" == "$module_name" ]; then
      package_json_path="$project_path/package.json"

      if [ -f "$package_json_path" ]; then
        project_name=$(jq '.name' $package_json_path | tr -d '"')
        existing_module="./node_modules/$project_name"
        if [ -d "$existing_module" ]; then
          rm -rf $existing_module
        fi
        ln -s $project_path ./node_modules/$project_name
        project_found=true
      else
        echo "Error: No package.json found in $project_path"
      fi

      break
    fi

  done
done

if [ ! $project_found == true ]; then
  echo "No project found for $module_name"
fi
