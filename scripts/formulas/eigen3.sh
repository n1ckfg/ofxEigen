#! /bin/bash
#
# Eigen
#
# uses CMake

# define the version
VER=5.0.1

# tools for git use
GIT_URL="https://gitlab.com/libeigen/eigen.git"
GIT_TAG=$VER

FORMULA_TYPES=( "osx" "linux64" "linuxaarch64" )

# download the source code and unpack it into LIB_NAME
function download() {
    git clone --depth=1 --branch ${GIT_TAG} ${GIT_URL} eigen3/
    cd eigen3/
}

# prepare the build environment, executed inside the lib src dir
function prepare() {
  echo "Nothing to prepare."
}

# executed inside the lib src dir
function build() {
  echo "Nothing to build."
}

# executed inside the lib src dir, first arg $1 is the dest libs dir root
function copy() {
    echo `pwd`
    # headers
    if [ -d $1/include ]; then
        rm -rf $1/include
    fi

    mkdir -p $1/include/
    mkdir -p $1/include/unsupported
    cp -r Eigen/ $1/include/Eigen/
    cp -r unsupported/Eigen/ $1/include/unsupported/Eigen/

}

# executed inside the lib src dir
function clean() {
  echo "Nothing to clean."
}
