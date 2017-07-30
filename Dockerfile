FROM ubuntu:16.04

MAINTAINER Yuta Fukasawa <yuta.fukasawa28@gmail.com>

# Install OpenCV 3.0

RUN apt-get update \
    && apt-get install -y build-essential cmake pkg-config \
    && libjpeg8-dev libpng12-dev python3.5-dev wget unzip \
    &&  python-numpy

RUN wget -O opencv.zip https://github.com/Itseez/opencv/archive/3.1.0.zip \
 && unzip opencv.zip \
 &&  cd opencv-3.1.0 \
 && mkdir build && cd build \
 && cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D INSTALL_C_EXAMPLES=OFF \
    .. \
 && make -j4 && make install \
 && rm -r /opencv-3.1.0 opencv.zip 
