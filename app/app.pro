#################################Example#####################################
include(../defaults.pri)

QT += widgets

TEMPLATE = app
TARGET = example

# set the path where the build target willl installed on the device
target.path=/home/senscio
INSTALLS += target

# Input
HEADERS += ./src/*.h
SOURCES += *.cpp

LIBS += \
  -L../build/release/ -lexample

CONFIG += console

CONFIG(debug, debug|release) {
    DESTDIR = ../build/debug
}
CONFIG(release, debug|release) {
    DESTDIR = ../build/release
}

OBJECTS_DIR = $$DESTDIR/.obj
MOC_DIR = $$DESTDIR/.moc
RCC_DIR = $$DESTDIR/.qrc
UI_DIR = $$DESTDIR/.u

QMAKE_RPATHDIR += ../../build/release

# Code coverage reporting (for Linux at least).
COVERAGE_DIR = $$DESTDIR/coverage
unix {
    # Enable gcov compile and link flags.
    QMAKE_CXXFLAGS += -fprofile-arcs -ftest-coverage
    QMAKE_LFLAGS += -fprofile-arcs -ftest-coverage
    QMAKE_CXXFLAGS_RELEASE -= -O1 -O2 -O3

    # Generate gcov's gcda files by executing the test program.
    gcov.depends = example
    gcov.target = $$OBJECTS_DIR/example.gcda
    gcov.commands = $$OBJECTS_DIR/example

    # Generate an lcov tracefile from gcov's gcda files.
    lcov.depends = $$OBJECTS_DIR/example.gcda
    lcov.target = $$OBJECTS_DIR/coverage.info
    lcov.commands = lcov --capture --base-directory $$PWD --directory $$OBJECTS_DIR \
                         --output $$OBJECTS_DIR/coverage.info --quiet; \
                    lcov --remove $$OBJECTS_DIR/coverage.info '"/usr/include/*/*"' \
                         '"example/**/*"' '"build/**/*"'\
                         --output $$OBJECTS_DIR/coverage.info --quiet

    # Generate HTML coverage reports from lcov's tracefile.
    coverage.depends = $$OBJECTS_DIR/coverage.info
    coverage.commands += genhtml --output-directory coverage_html \
                         --prefix `readlink -f ../../src` --quiet \
                         --title PROJECT_NAME coverage.info


    # Include the custom targets in the generated build scripts (eg Makefile).
    QMAKE_EXTRA_TARGETS += coverage gcov lcov

    # Clean up files generated by the above custom targets.
    #QMAKE_CLEAN += $$OBJECTS_DIR/*.gcda $$OBJECTS_DIR/*.gcno $$OBJECTS_DIR/coverage.info
    QMAKE_DISTCLEAN += -r coverage_html
}
