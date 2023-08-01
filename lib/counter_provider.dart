import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int count = 0;
  void increment() {
    count++;
    notifyListeners();
  } //for increment

  void decreament() {
    count--;
    notifyListeners();
  } //for decrement

  int count1 = -2;
  void increment1() {
    count1 += 2;
    notifyListeners();
  } //for increment

  void decreament1() {
    count1 -= 2;
    notifyListeners();
  } // for increm// for increment/decrement
}
