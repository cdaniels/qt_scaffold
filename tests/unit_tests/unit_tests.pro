#################################Example#####################################
include(../../defaults.pri)

QT += core

TEMPLATE = app
TARGET = unit_tests

# Input
HEADERS += ../../src/*.hpp
SOURCES += *.cpp

LIBS += \
  -L../../build/release/ -lexample \
  -lgcov -fprofile-arcs

CONFIG += console

DESTDIR = ../../build/tests

OBJECTS_DIR = $$DESTDIR/.obj
MOC_DIR = $$DESTDIR/.moc
RCC_DIR = $$DESTDIR/.qrc
UI_DIR = $$DESTDIR/.u


# Code coverage reporting (for Linux at least).
COVERAGE_DIR = $$DESTDIR/coverage
