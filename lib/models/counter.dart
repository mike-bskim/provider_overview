import 'package:flutter/foundation.dart';

class Counter with ChangeNotifier {
  int counter = 0;

  void increment() {
    counter++;
    notifyListeners();
  }

  void update(int value) {
    counter = value;
    notifyListeners();
  }
}