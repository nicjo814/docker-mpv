FROM nicjo814/docker-qtbase:qtppa

# specify apt packages to install
ENV APTLIST="libegl1-mesa libgl1-mesa-glx libice6 libsm6 libx11-xcb1 libx11-6 \
libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxinerama1 \
libxrandr2 libxrender1 libxss1 libxtst6 libxv1 libasound2 libbluray1 libcaca0 \
libcdio13 libcdio-cdda1 libcdio-paranoia1 libdvdnav4 libdvdread4 libenca0 \
libfontconfig1 libfreetype6 libgstreamer-plugins-base0.10-0 libguess1 libharfbuzz0b \
libicu52 libjack-jackd2-0 libjpeg-turbo8 liblua5.2-0 libpulse0 libpython3.4 librubberband2 \
libsmbclient libuchardet0 libv4l-0 libvdpau1 libwayland-egl1-mesa libxcb-icccm4 \
libxcb-image0 libxcb-keysyms1 libxcb-randr0 libxcb-render-util0 libxcb-render0 \
libxcb-shape0 libxcb-shm0 libxcb-sync1 libxcb-xfixes0 libxcb-xkb1 libxcb1 \
libxkbcommon-x11-0 libxkbcommon0 libgnutlsxx27 libmp3lame0 libopus0 libx264-142 \
libtheora0 wget"

ENV BUILD_APTLIST="git devscripts equivs \
autoconf automake autotools-dev docutils-common docutils-doc \
fontconfig-config fonts-dejavu-core ladspa-sdk libaacs0 libart-2.0-2 \
libasound2-data libasound2-dev libasyncns0 libavahi-client-dev \
libavahi-client3 libavahi-common-data libavahi-common-dev libavahi-common3 \
libbluray-dev libboost-system1.54.0 libbs2b-dev libbs2b0 \
libcaca-dev libcdio-cdda-dev libcdio-dev \
libcdio-paranoia-dev libcups2 libdbus-1-dev \
libdrm-amdgpu1 libdrm-dev libdrm-intel1 libdrm-nouveau2 libdrm-radeon1 \
libdvdnav-dev libdvdread-dev \
libegl1-mesa-dev libegl1-mesa-drivers libelf1 libelfg0 libenca-dev \
libexpat1-dev libfftw3-double3 libflac8 libfontconfig1-dev \
libfreetype6-dev libfribidi-dev libgbm1 libgcrypt11-dev \
libgl1-mesa-dev libgl1-mesa-dri libglapi-mesa libglib2.0-bin \
libglib2.0-data libglib2.0-dev libgme-dev libgme0 libgnutls-dev \
libgpg-error-dev libgraphite2-3 libgsm1 libgsm1-dev \
libguess-dev libharfbuzz-dev libharfbuzz-gobject0 libharfbuzz-icu0 \
libjack-jackd2-0 libjack-jackd2-dev libjbig0 \
libjpeg-dev libjpeg-turbo8-dev libjpeg8 libjpeg8-dev \
libjs-jquery liblcms2-2 liblcms2-dev libldb1 liblircclient-dev \
liblircclient0 libllvm3.4 libltdl-dev libltdl7 liblua5.2-dev \
libmirclient-dev libmirclient7 libmirclientplatform-mesa libmirprotobuf-dev \
libmirprotobuf0 libmodplug-dev libmodplug1 libmowgli-dev libmowgli2 \
libmp3lame-dev libntdb1 libogg-dev libogg0 libopenal-data \ 
libopenal-dev libopenal1 libopencore-amrnb-dev libopencore-amrnb0 \
libopencore-amrwb-dev libopencore-amrwb0 libopenjpeg-dev libopenjpeg2 \
libopenvg1-mesa libopus-dev liborc-0.4-0 liborc-0.4-dev \
libp11-kit-dev libpaper-utils libpaper1 libpciaccess0 libpcre3-dev \
libpcrecpp0 libpng12-dev libprotobuf-dev libprotobuf-lite8 libprotobuf8 \
libpthread-stubs0-dev libpulse-dev libpulse-mainloop-glib0 \
libpython2.7 libreadline-dev libreadline6-dev librtmp-dev librubberband-dev \
libsamplerate0 libschroedinger-1.0-0 libschroedinger-dev \
libsigsegv2 libslang2-dev libsmbclient-dev libsndfile1 \
libsoxr-dev libsoxr-lsr0 libsoxr0 libspeex-dev libspeex1 libssh-4 libssh-dev \
libssl-dev libssl-doc libtalloc2 libtasn1-6-dev libtdb1 libtevent0 \
libtheora-dev libtiff5 libtinfo-dev libtool libtwolame-dev \
libtwolame0 libtxc-dxtn-s2tc0 libuchardet-dev \
libv4l-dev libv4l2rds0 libv4lconvert0 libva-dev libva-drm1 libva-egl1 \
libva-glx1 libva-tpi1 libva-wayland1 libva-x11-1 libva1 libvdpau-dev \
libvo-amrwbenc-dev libvo-amrwbenc0 libvorbis-dev libvorbis0a \
libvorbisenc2 libvorbisfile3 libvpx-dev libvpx1 libwavpack-dev libwavpack1 \
libwayland-client0 libwayland-cursor0 libwayland-dev \
libwayland-server0 libwbclient0 libwebp5 libwebpmux1 libx11-data \
libx11-dev libx11-doc libx11-xcb-dev libx264-dev \
libxau-dev libxau6 libxcb-dri2-0 libxcb-dri2-0-dev libxcb-dri3-0 \
libxcb-dri3-dev libxcb-glx0 libxcb-glx0-dev libxcb-present-dev \
libxcb-present0 libxcb-randr0-dev \
libxcb-render0-dev libxcb-shape0-dev libxcb-sync-dev \
libxcb-xfixes0-dev libxcb1-dev \
libxdamage-dev libxdmcp-dev libxdmcp6 libxext-dev \
libxfixes-dev libxinerama-dev \
libxrandr-dev libxrender-dev libxshmfence-dev \
libxshmfence1 libxss-dev libxv-dev libxvidcore-dev \
libxvidcore4 libxxf86vm-dev libxxf86vm1 m4 mesa-common-dev mircommon-dev \
pkg-config python-chardet python-docutils python-pdfrw python-pil \
python-pkg-resources python-pygments python-renderpm python-reportlab \
python-reportlab-accel python-roman python-setuptools python-simplejson \
python-support python-talloc rst2pdf samba-libs x11-common x11proto-core-dev \
x11proto-damage-dev x11proto-dri2-dev x11proto-fixes-dev x11proto-gl-dev \
x11proto-input-dev x11proto-kb-dev x11proto-randr-dev x11proto-render-dev \
x11proto-scrnsaver-dev x11proto-video-dev x11proto-xext-dev \
x11proto-xf86vidmode-dev x11proto-xinerama-dev xorg-sgml-doctools xtrans-dev \
yasm zlib1g-dev libffi-dev libxml2-dev libxkbcommon-dev python3.4-dev cython3 \
cmake mercurial"

#add repository
RUN add-apt-repository -y ppa:george-edison55/cmake-3.x && \

# install packages
apt-get update -q && \
apt-get install \
$APTLIST $BUILD_APTLIST -qy && \

# build mpv and it's dependencies
mkdir -p /tmp && \

#start with Wayland (too old)
cd /tmp && \
git clone git://anongit.freedesktop.org/wayland/wayland && \
cd wayland && \
./autogen.sh --prefix="/usr/local" --disable-documentation && \
make && \
make install && \

#zimg
cd /tmp && \
git clone https://github.com/sekrit-twc/zimg.git && \
cd zimg && \
./autogen.sh --prefix="/usr/local" && \
./configure --prefix="/usr/local" && \
make && \
make install && \

#next VapourSynth (too old)
cd /tmp && \
git clone https://github.com/vapoursynth/vapoursynth.git && \
cd vapoursynth && \
./autogen.sh --prefix="/usr/local" && \
./configure --prefix="/usr/local" && \
make && \
make install && \

#next libva (version in repo is too old)
cd /tmp && \
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
./update && \
./clean && \

#build libass
cd libass && \
./autogen.sh --prefix="/usr/local" --with-pic -j4 && \
./configure --prefix="/usr/local" --with-pic && \
make -j4 && \
make install && \

#build ffmpeg
#first x265
cd ../ffmpeg && \
hg clone https://bitbucket.org/multicoreware/x265 && \
cd x265/build/linux && \
cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="/usr/local" -DENABLE_SHARED:bool=on ../../source && \
make && \
make install && \
#libfdk-aac
cd /tmp/mpv-build/ffmpeg && \
wget -O fdk-aac.tar.gz https://github.com/mstorsjo/fdk-aac/tarball/master && \
tar xzvf fdk-aac.tar.gz && \
cd mstorsjo-fdk-aac* && \
autoreconf -fiv && \
./configure --prefix="/usr/local" && \
make && \
make install && \
make distclean && \
#libvpx
cd /tmp/mpv-build/ffmpeg && \
wget http://storage.googleapis.com/downloads.webmproject.org/releases/webm/libvpx-1.5.0.tar.bz2 && \
tar xjvf libvpx-1.5.0.tar.bz2 && \
cd libvpx-1.5.0 && \
./configure --prefix="/usr/local" --disable-examples --disable-unit-tests --enable-pic && \
make && \
make install && \
make clean && \
#finally ffmpeg itself
cd /tmp/mpv-build/ffmpeg && \
./configure --prefix="/usr/local" \
--enable-pic \
--enable-gpl \
--enable-libass \
--enable-libfdk-aac \
--enable-libfreetype \
--enable-libmp3lame \
--enable-libopus \
--enable-libtheora \
--enable-libvorbis \
--enable-libvpx \
--enable-libx264 \
--enable-libx265 \
--enable-nonfree \
--enable-gnutls \
--disable-debug \
--disable-doc && \
make -j4 && \
make install && \

#finally build mpv
cd /tmp && \
git clone https://github.com/mpv-player/mpv.git && \
cd mpv && \
./bootstrap.py && \
./waf configure --enable-libmpv-shared --prefix=/usr/local && \
./waf build && \
./waf install && \

# cleanup 
#cd / && \
#apt-get purge --remove $BUILD_APTLIST -y && \
#apt-get autoremove -y && \
#apt-get install $APTLIST -qy && \
#apt-get clean -y && \
rm -rf /var/tmp/* /tmp/* 
