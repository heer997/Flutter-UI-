import "package:flutter/material.dart";
import "package:provider/provider.dart";

class CounterApp with ChangeNotifier {
  int count = 0;

  void increment() {
    count++;
    notifyListeners();
  }

  void decrement() {
    count--;
    notifyListeners();
  }
}
