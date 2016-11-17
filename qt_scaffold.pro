#################################Example#####################################

TEMPLATE = subdirs
CONFIG+=ordered

# Disable automatic ASCII conversions (best practice for internationalization).
DEFINES += QT_NO_CAST_FROM_ASCII QT_NO_CAST_TO_ASCII

SUBDIRS = \
  src \
  app
app.depends = src

unix {
  SUBDIRS += \
    tests/unit_tests \
    tests/end-to-end_tests \
    doc

  tests/unit_tests.depends = src
  tests/end-to-end_tests.depends = src
}



