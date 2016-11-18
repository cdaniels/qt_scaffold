#!/bin/bash
# initiate the submodules
git submodule init

# initiate and build the boost submodule
cd lib/boost_1_57_0
git submodule init
git submodule update
./bootstrap.sh
./b2
# return to the project directory
cd ../../

# initiate and build the cucumber cpp submodule
cd lib/cucumber-cpp
# Download test suite
git submodule init
git submodule update
# Create build directory
cmake -E make_directory build
# Generate Makefiles
cmake -E chdir build cmake -DCUKE_ENABLE_EXAMPLES=on ..
# Build cucumber-cpp and tests
cmake --build build
# Run unit tests
cmake --build build --target test
# Check implementation against common cucumber test suite
cmake --build build --target features
# return to the project directory
cd ../../

