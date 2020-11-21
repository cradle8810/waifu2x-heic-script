FROM ubuntu:20.04

# Prevent the tzdata package interactive configuration screen
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update && \
    apt-get install -y \
        cmake \
        ffmpeg=7:4.2.4-1ubuntu0.1 \
        g++ \
        gcc \
        git \
        gpac=0.5.2-426-gc5ad4e4+dfsg5-5 \
        libopencv-dev \
        make \
        && \
    apt-get clean all

# OpenCV library install required.

RUN WORK=$(mktemp -d) && \
    cd ${WORK} && \
    git clone https://github.com/tanakamura/waifu2x-converter-cpp.git && \
    mkdir build && \
    cd build && \
    pwd && \
    cmake -S .. -B . && \
    cmake install && \
    cd / && \
    rm -fr ${WORK}
