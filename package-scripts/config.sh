#!/bin/bash

### Common Configurations ###

#Package Info
PACKAGE_NAME=test_$1
VERSION=1.$2-0

#Package build directory
BUILD_DIR=./build/package

#Output directories from root of target file system.
BINARY_DIR=usr/bin
CONF_DIR=etc/$PACKAGE_NAME

# List file in format 'path/to/file nameofinstalledfile'
BINARY_FILES=(./build/bin/$3/hello hello ./main.cpp main.cpp)
CONF_FILES=(CMakeLists.txt test.txt)

### Legato Configurations ###

### Debian Configurations ###

ARCH="amd64"
DEPENDS="clang-3.9 (>= 3.9)"
MAINTAINER="Kato Engineering"
PRIORITY="optional"
DESCRIPTION="This is a test package"

SERVICE_DIR=etc/systemd/system

SERIVICE_FILES=

#Location of install and remove scripts
PRE_INSTALL_SCRIPT=
POST_INSTALL_SCRIPT=./postinstall.sh
PRE_REMOVE_SCRIPT=
POST_REMOVE_SCRIPT=