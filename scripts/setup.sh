
# check if .bacalhau exists
if [ -d .bacalhau ]; then
    echo "Bacalhau is already installed"
fi

# check if .bacalhau does not exist
if [ ! -d .bacalhau ]; then
    echo "Installing Bacalhau"
    # install the latest bacalhau which works with GPUs (https://github.com/bacalhau-project/bacalhau/issues/2858)
    wget https://github.com/bacalhau-project/bacalhau/releases/download/v1.0.3/bacalhau_v1.0.3_linux_amd64.tar.gz
    mkdir .bacalhau
    tar xfv bacalhau_v1.0.3_linux_amd64.tar.gz
    mv bacalhau .bacalhau/
    chmod +x .bacalhau/bacalhau
    rm bacalhau_v1.0.3_linux_amd64.tar.gz

    mkdir .bacalhau/data/ipfs
    export BACALHAU_SERVE_IPFS_PATH=.bacalhau/data/ipfs
fi
