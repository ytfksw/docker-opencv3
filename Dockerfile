FROM ubuntu:16.04

MAINTAINER Yuta Fukasawa <yuta.fukasawa28@gmail.com>

ENV NUM_CORES 4

RUN apt-get update

# Install OpenCV 3.0
RUN apt-get install -y build-essential cmake pkg-config \
 libjpeg8-dev libtiff5-dev libjasper-dev libpng12-dev \
 libavcodec-dev libavformat-dev libswscale-dev libv4l-dev \
 libxvidcore-dev libx264-dev libgtk-3-dev libatlas-base-dev \
 gfortran python2.7-dev python3.5-dev wget
RUN apt-get install -y python-pip python3-pip
RUN pip install numpy && pip3 install numpy
RUN apt-get install unzip
RUN wget -O opencv.zip https://github.com/Itseez/opencv/archive/3.1.0.zip \
 && unzip opencv.zip \
 && wget -O opencv_contrib.zip https://github.com/Itseez/opencv_contrib/archive/3.1.0.zip \
 && unzip opencv_contrib.zip
RUN cd opencv-3.1.0 \
 && mkdir build && cd build \
 && cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D INSTALL_PYTHON_EXAMPLES=ON \
    -D INSTALL_C_EXAMPLES=OFF \
    -D OPENCV_EXTRA_MODULES_PATH=/opencv_contrib-3.1.0/modules \
    -D BUILD_EXAMPLES=ON .. \
 && make -j4 && make install

RUN rm -r /opencv_contrib-3.1.0 /opencv-3.1.0 opencv.zip opencv_contrib.zip
