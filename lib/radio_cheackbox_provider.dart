import 'package:flutter/material.dart';

class RadioCheckBoxProvider extends ChangeNotifier {
  String gender = 'gender', male = 'male', female = 'female';
  List<String> hobby = [];
  bool isCricket = false, isFootBall = false, isShowData = false;
  void checkGender(String value) {
    isShowData = false;
    gender = value;
    notifyListeners();
  }

  void checkCricket(bool value) {
    isShowData = false;
    isCricket = value;
    isCricket == true ? hobby.add('Cricket') : hobby.remove('Cricket');

    notifyListeners();
  }

  void checkFootball(bool value) {
    isShowData = false;
    isFootBall = value;
    isFootBall == true ? hobby.add('FootBall') : hobby.remove('FootBall');
    notifyListeners();
  }

  void showData() {
    isShowData = true;
    notifyListeners();
  }
}
