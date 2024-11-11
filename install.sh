#!/bin/bash

declare -A colors
colors[red]="\033[0;31m"
colors[green]="\033[0;32m"
colors[yellow]="\033[1;33m"
colors[blue]="\033[1;34m"
colors[neutral]="\033[0m"

clear

source scripts/hello.sh

source scripts/check_os.sh

source scripts/update-system.sh

source scripts/add-ppas.sh

source scripts/drivers-gpu.sh

source scripts/apps.sh

source scripts/gnome-utils.sh

source scripts/customization.sh

source scripts/byebye.sh
