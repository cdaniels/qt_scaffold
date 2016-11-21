#################################Example#####################################
include(../../defaults.pri)

QT += widgets testlib

TEMPLATE = app
TARGET = end-to-end_tests

# Input
SOURCES += ./features/step_definitions/BoostCalculatorQtSteps.cpp

# disable the deprecation messages for legacy boost version
QMAKE_CXXFLAGS += -Wno-deprecated

# link the libraries
LIBS += \
  -L../../build/release/ -lexample \
  -L../../lib/cucumber-cpp/build/src -lcucumber-cpp \
  -L../../lib/boost_1_57_0/libs \
    -lboost_thread \
    -lboost_system \
    -lboost_unit_test_framework \
    -lboost_program_options \
    -lboost_regex \



CONFIG += console

DESTDIR = ../../build/tests

OBJECTS_DIR = $$DESTDIR/.obj
MOC_DIR = $$DESTDIR/.moc
RCC_DIR = $$DESTDIR/.qrc
UI_DIR = $$DESTDIR/.u


# Code coverage reporting (for Linux at least).
COVERAGE_DIR = $$DESTDIR/coverage
unix {
    # Enable gcov compile and link flags.
    QMAKE_CXXFLAGS += -fprofile-arcs -ftest-coverage
    QMAKE_LFLAGS += -fprofile-arcs -ftest-coverage
    QMAKE_CXXFLAGS_RELEASE -= -O1 -O2 -O3
}
