#!/bin/bash
# +-----------------+
# | Snowboy updater |
# | by Bugsounet    |
# | Rev 2.0.0       |
# +-----------------+
# get the installer directory
Installer_get_current_dir () {
  SOURCE="${BASH_SOURCE[0]}"
  while [ -h "$SOURCE" ]; do
    DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
    SOURCE="$(readlink "$SOURCE")"
    [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE"
  done
  echo "$( cd -P "$( dirname "$SOURCE" )" && pwd )"
}

Installer_dir="$(Installer_get_current_dir)"

# move to installler directory
cd "$Installer_dir"
source utils.sh
Installer_info "Welcome to MMM-Snowboy updater !"
echo

cd ~/MagicMirror/modules/MMM-Snowboy
# deleting package.json because npm install add/update package
rm -f package-lock.json
Installer_info "Updating..."
git reset --hard HEAD
git pull

Installer_info "Deleting ALL @bugsounet libraries..."
cd ~/MagicMirror/modules/MMM-Snowboy/node_modules
rm -rf @bugsounet

Installer_info "Ready for Installing..."
# launch installer
npm install
