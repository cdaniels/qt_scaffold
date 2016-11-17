#################################Example#####################################

TEMPLATE = subdirs
CONFIG+=ordered

# Disable automatic ASCII conversions (best practice for internationalization).
DEFINES += QT_NO_CAST_FROM_ASCII QT_NO_CAST_TO_ASCII

SUBDIRS = \
  src \
  app \
  doc \
  tests/unit_tests \
  tests/end-to-end_tests \

app.depends = src
tests/unit_tests.depends = src
tests/end-to-end_tests.depends = src
