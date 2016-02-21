FROM nicjo814/docker-qtbase

# specify apt packages to install
ENV APTLIST=""

ENV BUILD_APTLIST="git python build-essential autoconf yasm libfribidi-dev \
libfreetype6-dev libfontconfig1-dev libharfbuzz-dev libtool libasound2-dev \
libpulse-dev libvdpau-dev libluajit-5.1-dev libsmbclient-dev libbluray-dev \
libdvdread-dev libcdio-paranoia-dev libguess-dev libuchardet-dev librubberband-dev \
liblcms2-dev libpulse-dev libjack-jackd2-dev libasound2-dev libdrm-dev \
libxkbcommon-dev"

# install packages
RUN apt-get update -q && \
apt-get install \
$APTLIST $BUILD_APTLIST -qy

# build mpv
RUN mkdir -p /tmp && \
cd /tmp && \
git clone https://github.com/mpv-player/mpv-build.git
#cd mpv-build && \
#./rebuild -j4 && \
#cd libass && \
#./configure -prefix /usr/local && \
#make && \
#make install

# cleanup 
#RUN cd / && \
#apt-get purge --remove $BUILD_APTLIST $APTLIST -y && \
#apt-get autoremove -y && \
#apt-get clean -y && \
#rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/* 
