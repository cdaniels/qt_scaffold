#################################Example#####################################

TEMPLATE = subdirs
CONFIG+=ordered

# Disable automatic ASCII conversions (best practice for internationalization).
DEFINES += QT_NO_CAST_FROM_ASCII QT_NO_CAST_TO_ASCII

# settup the app project to build after the src project is completed
SUBDIRS = \
  src \
  app
app.depends = src

# setp the tests and doc generation te run after the the src project is completed
unix {
  SUBDIRS += \
    tests/unit_tests \
    tests/end-to-end_tests \
    doc

  tests/unit_tests.depends = src
  tests/end-to-end_tests.depends = src
}



