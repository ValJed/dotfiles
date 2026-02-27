{pkgs ? import <nixpkgs>}:
pkgs.writeShellScriptBin "act-update" ''
  cd ~
  mkdir -p apps
  cd apps
  if [ ! -d assembly-cloud-tools ]; then
    git clone git@github.com:apostrophecms/assembly-cloud-tools.git
  fi
  cd ./assembly-cloud-tools
  git pull
  npm install
  rm ./package-lock.json
''
