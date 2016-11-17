#################################Example#####################################
include(../defaults.pri)

QT += widgets

TEMPLATE = lib
TARGET = example

# Input
HEADERS += *.h
SOURCES += *.cpp

CONFIG += staticlib

# specify the destination directory
DESTDIR = ../build/release/

OBJECTS_DIR = $$DESTDIR/.obj
MOC_DIR = $$DESTDIR/.moc
RCC_DIR = $$DESTDIR/.qrc
UI_DIR = $$DESTDIR/.u

# Code coverage reporting (for Linux at least).
COVERAGE_DIR = $$DESTDIR/coverage
win32 {
    #TODO: implement test coverage for windows here...
}
unix:debug {
    CONFIG += debug console 

    # Enable gcov compile and link flags.
    QMAKE_CXXFLAGS += -fprofile-arcs -ftest-coverage
    QMAKE_LFLAGS += -fprofile-arcs -ftest-coverage
    QMAKE_CXXFLAGS_RELEASE -= -O1 -O2 -O3
    QMAKE_RPATHDIR += ../../build/release

    # Include the custom targets in the generated build scripts (eg Makefile).
    QMAKE_EXTRA_TARGETS += coverage gcov lcov

    # Clean up files generated by the above custom targets.
    #QMAKE_CLEAN += $$OBJECTS_DIR/*.gcda $$OBJECTS_DIR/*.gcno $$OBJECTS_DIR/coverage.info
    QMAKE_DISTCLEAN += -r coverage_html
}
