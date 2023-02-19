# Use the official Ubuntu 20.04 image as the base image
FROM ubuntu:20.04

# Update the package lists and install the necessary packages
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y python3 git cmake build-essential gcc-arm-none-eabi libnewlib-arm-none-eabi \
    libstdc++-arm-none-eabi-newlib && \
    rm -rf /var/lib/apt/lists/*

# Clone the Pico SDK repository and set the working directory to its root
RUN git clone -b master --recurse-submodules https://github.com/raspberrypi/pico-sdk.git && \
    cd pico-sdk

# Set environment variables for the Pico SDK paths
ENV PICO_SDK_PATH=/pico-sdk
ENV PICO_TOOLCHAIN_PATH=/usr

# Set the working directory. You can use this directory to mount external volumes on.
RUN mkdir /app
WORKDIR /app

# Set the entry point to a shell
# You can run build commands here
ENTRYPOINT ["/bin/bash"]
