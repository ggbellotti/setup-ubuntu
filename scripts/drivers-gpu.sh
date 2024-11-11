gpu=$(lspci | grep -e VGA -e 3D)

if [[ $gpu == *"NVIDIA"* ]]; then
    echo "------ Placa de vídeo NVIDIA detectada. Instalando o driver da NVIDIA..."
    sudo apt update
    sudo apt install nvidia-driver nvidia-cuda-toolkit nvidia-settings nvidia-utils -y
elif [[ $gpu == *"AMD"* ]] || [[ $gpu == *"Radeon"* ]]; then
    echo "------ Placa de vídeo AMD detectada. Instalando o driver da AMD..."
    sudo apt update
    sudo apt install mesa-vulkan-drivers mesa-vulkan-drivers:i386 -y
    sudo apt install amdgpu-dkms rocm-hip-libraries -y
else
    echo "------ Placa de vídeo não identificada ou não requer driver adicional."
fi

source update-system.sh