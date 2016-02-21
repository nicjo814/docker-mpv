FROM nicjo814/docker-qtbase

# specify apt packages to install
ENV APTLIST=""

ENV BUILD_APTLIST="git python build-essential autoconf yasm libfribidi-dev \
libfreetype6-dev libfontconfig1-dev libharfbuzz-dev libtool libasound2-dev \
libpulse-dev libvdpau-dev libluajit-5.1-dev libsmbclient-dev libbluray-dev \
libdvdread-dev libcdio-paranoia-dev libguess-dev libuchardet-dev librubberband-dev \
liblcms2-dev libpulse-dev libjack-jackd2-dev libasound2-dev libdrm-dev \
libxkbcommon-dev automake libass-dev libsdl1.2-dev libtheora-dev libva-dev \
libvorbis-dev libxcb1-dev libxcb-shm0-dev libxcb-xfixes0-dev pkg-config texinfo \
zlib1g-dev"

# install packages
RUN apt-get update -q && \
apt-get install \
$APTLIST $BUILD_APTLIST -qy

# build mpv and it's dependencies
RUN mkdir -p /tmp && \
cd /tmp && \
#start with some helper scripts
git clone https://github.com/mpv-player/mpv-build.git && \
cd mpv-build && \
./rebuild -j4 && \
#build libass
cd libass && \
./configure -prefix /usr/local && \
make && \
make install && \
libtool --finish /tmp/mpv-build/build_libs/lib && \
#build ffmpeg
cd ../ffmpeg && \
./configure --prefix=/usr/local && \
make && \
make install && \
cd .. && \
#finally build mpv
git clone https://github.com/mpv-player/mpv.git

# cleanup 
#RUN cd / && \
#apt-get purge --remove $BUILD_APTLIST $APTLIST -y && \
#apt-get autoremove -y && \
#apt-get clean -y && \
#rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/* 
