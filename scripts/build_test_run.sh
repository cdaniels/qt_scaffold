#!/bin/bash
./scripts/compile.sh;
./scripts/test.sh;
./scripts/processCoverage.sh;

# open up the browser to the coverage file
google-chrome ./build/coverage/index.html
google-chrome ./build/docs/html/index.html

# run the app
./scripts/run.sh;

