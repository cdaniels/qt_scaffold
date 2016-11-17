TEMPLATE = aux

system(type "doxygen" > /dev/null) {
  first.commands = doxygen
  QMAKE_EXTRA_TARGETS += first
}
