#!/bin/bash

declare -A colors
colors[red]="\033[0;31m"
colors[green]="\033[0;32m"
colors[yellow]="\033[1;33m"
colors[blue]="\033[1;34m"
colors[neutral]="\033[0m"

clear

source ~/setup-ubuntu/scripts/hello.sh

source ~/setup-ubuntu/scripts/check_os.sh

source ~/setup-ubuntu/scripts/update-system.sh

source ~/setup-ubuntu/scripts/add-ppas.sh

source ~/setup-ubuntu/scripts/drivers-gpu.sh

source ~/setup-ubuntu/scripts/apps.sh

source ~/setup-ubuntu/scripts/gnome-utils.sh

source ~/setup-ubuntu/scripts/customization.sh

source ~/setup-ubuntu/scripts/byebye.sh
