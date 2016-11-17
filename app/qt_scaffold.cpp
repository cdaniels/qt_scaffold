// simple example demonstrating a Qt Application tested with Chance
#include <iostream>
#include <QApplication>

#include "CalculatorWidget.h"
#include <myclass.h>

using namespace std;

int main(int argc, char *argv[]) {
  MyClass adder;
  cout << adder.addition(10, 20) << endl;

  QApplication app(argc, argv);
  app.setApplicationName("Qt Calculator");
  CalculatorWidget widget;
  widget.show();
  return app.exec();
}
