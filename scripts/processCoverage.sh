#!/bin/bash
# simple script for generating coverage data from cpp code 
# which has been compiled with gcov and has been run after compilation
# so that .gcda files are created

#export GCOV_PREFIX="./build/tests/.obj"
export GCOV_PREFIX="./build/release/.obj"

#find $GCOV_PREFIX -type f -name '*.gcda' -print | xargs /bin/rm -f


# capture test coverage data from the gcda files and store it in coverage.info
lcov \
  --capture \
  --directory $GCOV_PREFIX \
  --output-file $GCOV_PREFIX/coverage.info \
  --base-directory ./src

# remove coverage data for dependency files
lcov --remove $GCOV_PREFIX/coverage.info \
  "/usr/include/**/*" \
  "**/*.moc*" \
  "Qt*" \
  --output-file $GCOV_PREFIX/coverage.info \

# generate an html report from the coverage data
genhtml --output-directory $PWD/build/coverage $GCOV_PREFIX/coverage.info
