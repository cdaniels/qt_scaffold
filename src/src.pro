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
win32 {
    #TODO: implement test coverage for windows here...
}
unix {
    CONFIG += debug console 

    # Enable gcov compile and link flags.
    QMAKE_CXXFLAGS += -fprofile-arcs -ftest-coverage
    QMAKE_LFLAGS += -fprofile-arcs -ftest-coverage
    QMAKE_CXXFLAGS_RELEASE -= -O1 -O2 -O3
}
