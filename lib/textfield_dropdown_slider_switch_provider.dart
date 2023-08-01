import 'package:flutter/material.dart';

class TextFieldDropDownSliderSwitchProvider extends ChangeNotifier {
  TextEditingController txtNameController = TextEditingController();
  TextEditingController txtDivController = TextEditingController();
  TextEditingController txtRollController = TextEditingController();
  String gender = 'gender',
      male = 'male',
      female = 'female',
      selectedStream = 'BE';
  List<String> hobby = [];
  List<String> stream = [];
  double age = 5;

  bool isCricket = false,
      isFootBall = false,
      isShowData = false,
      isSwitchOn = false;

  List streams = ['BE', 'MBA', 'CA', 'IT'];
  void clearData() {
    txtNameController.clear();
    txtDivController.clear();
    txtRollController.clear();
    streams.clear();
    hobby.clear();
  }

  void cheakSlider(double value) {
    isShowData = false;
    age = value;
  }

  void checkSwitch(bool value) {
    isShowData = false;
    isSwitchOn = value;
    notifyListeners();
  }

  void checkStream(String value) {
    isShowData = false;
    selectedStream = value;
    notifyListeners();
  }

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
