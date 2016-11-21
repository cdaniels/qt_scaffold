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

CONFIG += console

CONFIG(debug, debug|release) {
    LIBS += \
        -L../build/debug/ -lexample
    DESTDIR = ../build/debug
}
CONFIG(release, debug|release) {
    LIBS += \
        -L../build/release/ -lexample
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
}
