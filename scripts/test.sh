#!/bin/bash
# load the shared library dependencies
export LD_LIBRARY_PATH=./build/release

# run static syntax and usage check
cppcheck --enable=all ./app
cppcheck --enable=all ./src

# run the unit tests
echo "--------------------------"
echo "!!! RUNNING UNIT TESTS !!!"
echo "--------------------------"
./build/tests/unit_tests

# run the end-to-end tests
echo "--------------------------------"
echo "!!! RUNNING END-TO-END TESTS !!!"
echo "--------------------------------"
./build/tests/end-to-end_tests > /dev/null &
cucumber tests/end-to-end_tests
