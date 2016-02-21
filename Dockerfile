FROM nicjo814/docker-qtbase

# specify apt packages to install
ENV APTLIST=""

ENV BUILD_APTLIST="git devscripts equivs \
autoconf automake autotools-dev docutils-common docutils-doc \
fontconfig-config fonts-dejavu-core ladspa-sdk libaacs0 libart-2.0-2 \
libasound2 libasound2-data libasound2-dev libasyncns0 libavahi-client-dev \
libavahi-client3 libavahi-common-data libavahi-common-dev libavahi-common3 \
libbluray-dev libbluray1 libboost-system1.54.0 libbs2b-dev libbs2b0 \
libcaca-dev libcaca0 libcdio-cdda-dev libcdio-cdda1 libcdio-dev \
libcdio-paranoia-dev libcdio-paranoia1 libcdio13 libcups2 libdbus-1-dev \
libdrm-amdgpu1 libdrm-dev libdrm-intel1 libdrm-nouveau2 libdrm-radeon1 \
libdvdnav-dev libdvdnav4 libdvdread-dev libdvdread4 libegl1-mesa \
libegl1-mesa-dev libegl1-mesa-drivers libelf1 libelfg0 libenca-dev libenca0 \
libexpat1-dev libfftw3-double3 libflac8 libfontconfig1 libfontconfig1-dev \
libfreetype6 libfreetype6-dev libfribidi-dev libgbm1 libgcrypt11-dev \
libgl1-mesa-dev libgl1-mesa-dri libgl1-mesa-glx libglapi-mesa libglib2.0-bin \
libglib2.0-data libglib2.0-dev libgme-dev libgme0 libgnutls-dev \
libgnutlsxx27 libgpg-error-dev libgraphite2-3 libgsm1 libgsm1-dev \
libguess-dev libguess1 libharfbuzz-dev libharfbuzz-gobject0 libharfbuzz-icu0 \
libharfbuzz0b libicu52 libjack-jackd2-0 libjack-jackd2-dev libjbig0 \
libjpeg-dev libjpeg-turbo8 libjpeg-turbo8-dev libjpeg8 libjpeg8-dev \
libjs-jquery liblcms2-2 liblcms2-dev libldb1 liblircclient-dev \
liblircclient0 libllvm3.4 libltdl-dev libltdl7 liblua5.2-0 liblua5.2-dev \
libmirclient-dev libmirclient7 libmirclientplatform-mesa libmirprotobuf-dev \
libmirprotobuf0 libmodplug-dev libmodplug1 libmowgli-dev libmowgli2 \
libmp3lame-dev libmp3lame0 libntdb1 libogg-dev libogg0 libopenal-data \ 
libopenal-dev libopenal1 libopencore-amrnb-dev libopencore-amrnb0 \
libopencore-amrwb-dev libopencore-amrwb0 libopenjpeg-dev libopenjpeg2 \
libopenvg1-mesa libopus-dev libopus0 liborc-0.4-0 liborc-0.4-dev \
libp11-kit-dev libpaper-utils libpaper1 libpciaccess0 libpcre3-dev \
libpcrecpp0 libpng12-dev libprotobuf-dev libprotobuf-lite8 libprotobuf8 \
libpthread-stubs0-dev libpulse-dev libpulse-mainloop-glib0 libpulse0 \
libpython2.7 libreadline-dev libreadline6-dev librtmp-dev librubberband-dev \
librubberband2 libsamplerate0 libschroedinger-1.0-0 libschroedinger-dev \
libsigsegv2 libslang2-dev libsmbclient libsmbclient-dev libsndfile1 \
libsoxr-dev libsoxr-lsr0 libsoxr0 libspeex-dev libspeex1 libssh-4 libssh-dev \
libssl-dev libssl-doc libtalloc2 libtasn1-6-dev libtdb1 libtevent0 \
libtheora-dev libtheora0 libtiff5 libtinfo-dev libtool libtwolame-dev \
libtwolame0 libtxc-dxtn-s2tc0 libuchardet-dev libuchardet0 libv4l-0 \
libv4l-dev libv4l2rds0 libv4lconvert0 libva-dev libva-drm1 libva-egl1 \
libva-glx1 libva-tpi1 libva-wayland1 libva-x11-1 libva1 libvdpau-dev \
libvdpau1 libvo-amrwbenc-dev libvo-amrwbenc0 libvorbis-dev libvorbis0a \
libvorbisenc2 libvorbisfile3 libvpx-dev libvpx1 libwavpack-dev libwavpack1 \
libwayland-client0 libwayland-cursor0 libwayland-dev libwayland-egl1-mesa \
libwayland-server0 libwbclient0 libwebp5 libwebpmux1 libx11-6 libx11-data \
libx11-dev libx11-doc libx11-xcb-dev libx11-xcb1 libx264-142 libx264-dev \
libxau-dev libxau6 libxcb-dri2-0 libxcb-dri2-0-dev libxcb-dri3-0 \
libxcb-dri3-dev libxcb-glx0 libxcb-glx0-dev libxcb-present-dev \
libxcb-present0 libxcb-randr0 libxcb-randr0-dev libxcb-render0 \
libxcb-render0-dev libxcb-shape0 libxcb-shape0-dev libxcb-sync-dev \
libxcb-sync1 libxcb-xfixes0 libxcb-xfixes0-dev libxcb1 libxcb1-dev \
libxdamage-dev libxdamage1 libxdmcp-dev libxdmcp6 libxext-dev libxext6 \
libxfixes-dev libxfixes3 libxinerama-dev libxinerama1 libxkbcommon0 \
libxrandr-dev libxrandr2 libxrender-dev libxrender1 libxshmfence-dev \
libxshmfence1 libxss-dev libxss1 libxv-dev libxv1 libxvidcore-dev \
libxvidcore4 libxxf86vm-dev libxxf86vm1 m4 mesa-common-dev mircommon-dev \
pkg-config python-chardet python-docutils python-pdfrw python-pil \
python-pkg-resources python-pygments python-renderpm python-reportlab \
python-reportlab-accel python-roman python-setuptools python-simplejson \
python-support python-talloc rst2pdf samba-libs x11-common x11proto-core-dev \
x11proto-damage-dev x11proto-dri2-dev x11proto-fixes-dev x11proto-gl-dev \
x11proto-input-dev x11proto-kb-dev x11proto-randr-dev x11proto-render-dev \
x11proto-scrnsaver-dev x11proto-video-dev x11proto-xext-dev \
x11proto-xf86vidmode-dev x11proto-xinerama-dev xorg-sgml-doctools xtrans-dev \
yasm zlib1g-dev"

# install packages
RUN apt-get update -q && \
apt-get install \
$APTLIST $BUILD_APTLIST -qy

# build mpv and it's dependencies
RUN mkdir -p /tmp && \
cd /tmp && \

#start with libva (version in repo is to old)
git clone git://anongit.freedesktop.org/git/libva && \
cd libva && \
git checkout tags/libva-1.6.2 && \
./autogen.sh && \
make && \
make install && \

#next some helper scripts
cd /tmp && \
git clone https://github.com/mpv-player/mpv-build.git && \
cd mpv-build && \
./rebuild -j4 && \

#build libass
cd libass && \
./configure -prefix /usr/local --with-pic && \
make && \
make install && \
libtool --finish /tmp/mpv-build/build_libs/lib && \

#build ffmpeg
cd ../ffmpeg && \
./configure --prefix=/usr/local --enable-pic && \
make && \
make install

##build vapoursynth
RUN cd /tmp && \
#git clone https://github.com/vapoursynth/vapoursynth.git && \
#cd vapoursynth && \
#python3 ./bootstrap.py && \
#./waf configure && \
#./waf build && \
#python3 ./setup.py build && \
#./waf install && \
#python3 ./setup.py install && \

##build flash3kyuu_db
#cd /tmp && \

#echo "deb http://cz.archive.ubuntu.com/ubuntu wily main universe" >> /etc/apt/sources.list && \
#apt-get update && \
#apt-get install -qy \
#libxkbcommon-dev libwayland-dev libva-dev libva-drm1 libva-egl1 libva-glx1 libva-wayland1 \
#libva-x11-1 libva-tpi1 && \

#finally build mpv
cd /tmp && \
git clone https://github.com/mpv-player/mpv.git && \
cd mpv && \
./bootstrap.py && \
./waf configure --enable-libmpv-shared --prefix=/usr/local

# cleanup 
#RUN cd / && \
#apt-get purge --remove $BUILD_APTLIST $APTLIST -y && \
#apt-get autoremove -y && \
#apt-get clean -y && \
#rm -rf /var/lib/apt/lists/* /var/tmp/* /tmp/* 
