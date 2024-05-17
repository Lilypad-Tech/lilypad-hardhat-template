
LILYPAD_DIR=".lilypad"
# check if .lilypad exists
if [ -d $LILYPAD_DIR ]; then
    echo "Lilypad is already installed"
fi

# check if $LILYPAD_DIR does not exist
if [ ! -d $LILYPAD_DIR ]; then

    mkdir $LILYPAD_DIR

    # install lilypad
    echo "Installing Lilypad"
    LILYPAD_VERSION="v2.0.0-7b61040"
    # LILYPAD_BINARY="lilypad-darwin-arm64"
    LILYPAD_BINARY="lilypad-linux-amd64"

    sudo apt update
    sudo apt install libc6 -y
    wget https://github.com/Lilypad-Tech/lilypad/releases/download/$LILYPAD_VERSION/$LILYPAD_BINARY
    #tar xfv $LILYPAD_BINARY
    mv $LILYPAD_BINARY $LILYPAD_DIR/lilypad
    chmod +x $LILYPAD_DIR/lilypad
    rm $LILYPAD_BINARY

    echo "Installing Bacalhau"
    # BACALHAU_BINARY="bacalhau_v1.0.3_darwin_arm64.tar.gz"
    BACALHAU_BINARY="bacalhau_v1.0.3_linux_amd64.tar.gz"
    BACALHAU_VERSION="v1.0.3"
    
    # install the latest bacalhau which works with GPUs (https://github.com/bacalhau-project/bacalhau/issues/2858)    
    wget https://github.com/bacalhau-project/bacalhau/releases/download/$BACALHAU_VERSION/$BACALHAU_BINARY
    
    tar xfv $BACALHAU_BINARY
    mv bacalhau $LILYPAD_DIR/
    chmod +x $LILYPAD_DIR/bacalhau
    rm $BACALHAU_BINARY
    mkdir $LILYPAD_DIR/data
    mkdir $LILYPAD_DIR/data/ipfs
    export BACALHAU_SERVE_IPFS_PATH=$LILYPAD_DIR/data/ipfs
fi
