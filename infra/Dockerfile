FROM ubuntu:jammy

ARG arch=amd64
ENV LILYPAD_VERSION="v2.0.0-7b61040"
# ENV LILYPAD_BINARY="lilypad-darwin-arm64"
ENV LILYPAD_BINARY="lilypad-linux-amd64"

WORKDIR /app
RUN apt update && apt install wget net-tools -y
RUN wget https://github.com/Lilypad-Tech/lilypad/releases/download/$LILYPAD_VERSION/$LILYPAD_BINARY
RUN mv $LILYPAD_BINARY /usr/local/bin/lilypad
RUN chmod +x /usr/local/bin/lilypad

ENTRYPOINT ["/usr/local/bin/lilypad"]
