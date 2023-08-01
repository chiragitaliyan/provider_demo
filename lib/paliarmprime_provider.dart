import 'package:flutter/material.dart';

class CheckNumberProvider extends ChangeNotifier {
  TextEditingController txtNumbersController = TextEditingController();

  String resultpalindrom = '';
  String resultamstrong = '';
  String resultprinme = '';

  void palindrom(int number) {
    int rem = 0, sum = 0, temp = 0;
    temp = number;
    while (number > 0) {
      rem = number % 10;
      sum = sum * 10 + rem;
      number = number ~/ 10;
    }
    if (temp == sum) {
      resultpalindrom = 'palindrom';
    } else {
      resultpalindrom = ' not palindrom';
    }
    notifyListeners();
  }

  void amstrong(int number) {
    int sum = 0, reminder = 0;
    int temp = number;
    temp = number;
    while (number != 0) {
      reminder = number % 10;
      sum = sum + reminder * reminder * reminder;
      number = number ~/ 10;
    }

    if (sum == temp) {
      resultamstrong = 'amstrong';
    } else {
      resultamstrong = ' not amstrong';
    }
    notifyListeners();
  }

  void prime(int a) {
    int c = 0;
    for (int i = 2; i < a; i++) {
      if (a % i == 0) {
        c++;
      }
    }
    if (c == 0) {
      resultprinme = 'is prime';
    } else {
      resultprinme = ' not prim number';
    }
    notifyListeners();
  }
}
