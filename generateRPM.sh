#!/bin/sh
set -e

# 1. Clean and Build
rm -rf RPM_build
cmake -S . -B RPM_build -DCMAKE_BUILD_TYPE=Release
cmake --build RPM_build

# 2. Package
cd RPM_build
cpack -G RPM
