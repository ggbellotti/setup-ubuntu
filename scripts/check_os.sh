. /etc/os-release

echo -e "${colors[green]}------------ Check OS ------------"
if [ "$NAME" = "Ubuntu" ]; then
    echo "Is Ubuntu :)" 
else
    echo "Is not Ubuntu :("
    exit 1
fi