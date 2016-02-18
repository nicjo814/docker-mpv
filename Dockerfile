FROM nicjo814/qtbase:5.6.0-beta

# specify apt packages to install
ENV APTLIST=""

ENV BUILD_APTLIST="git python"

# install packages
RUN apt-get update -q && \
apt-get install \
$APTLIST $BUILD_APTLIST -qy

# build mpv
RUN mkdir -p /tmp && \
cd /tmp && \
git clone https://github.com/mpv-player/mpv-build.git && \
cd mpv-build && \
./rebuild -j4

# cleanup 
RUN cd / && \
apt-get purge --remove $BUILD_APTLIST $APTLIST -y && \
apt-get autoremove -y && \
apt-get clean -y && \
rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/* 
