FROM ubuntu:20.04
ENV TZ=Europe/Warsaw
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get install -y keyboard-configuration
RUN apt-get update && apt-get install -y git cmake build-essential pkg-config libboost-dev libgtk-3-dev libboost-all-dev libtbb-dev libcurl4-openssl-dev libcereal-dev libnlopt-dev libnlopt-cxx-dev libopenvdb-dev libopenvdb-tools libcgal-dev libwxgtk3.0-gtk3-dev

RUN git clone --branch version_2.3.1 https://github.com/prusa3d/PrusaSlicer
RUN cd PrusaSlicer && cmake . -DSLIC3R_WX_STABLE=1 -DSLIC3R_GTK=3
RUN cd PrusaSlicer && make -j4
