#!/bin/sh
set -e

# 1. Clean and Build
rm -rf DEB_build
cmake -S . -B DEB_build -DCMAKE_BUILD_TYPE=Release
cmake --build DEB_build

# 2. Package
cd DEB_build
cpack -G DEB
