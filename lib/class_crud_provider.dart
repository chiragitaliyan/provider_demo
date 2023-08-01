import 'package:flutter/material.dart';

class CrudProvider extends ChangeNotifier {
  TextEditingController txtNameController = TextEditingController();
  TextEditingController txtDivController = TextEditingController();
  TextEditingController txtRollController = TextEditingController();
  bool isShowData = false,
      isCricker = false,
      isFootBall = false,
      isSwitchOn = false;
  String gender = 'gender', male = 'male', female = 'female';
  String? selectedStream;
  List<String> hobby = [];
  List<String> stream = [];
  List<Map> data = [];
  List streams = ['BE', 'MBA', 'BTech', 'IT'];
  double age = 5;
  int selectedIndex = 0;

  void checkAdd() {
    data.add({
      'Name': txtNameController,
      'Div': txtDivController.text,
      'Roll': txtDivController.text,
      'Gender': gender,
      'Hobby': List.from(hobby.map((e) => Element)).toList(),
      'Stream': selectedStream,
      'Age': age,
      'Switch': isSwitchOn
    });
    print(data);
    clearData();
  }

  void clearData() {
    txtNameController.clear();
    txtDivController.clear();
    txtRollController.clear();
    isCricker = false;
    isFootBall = false;
    hobby.clear();
    gender = false.toString();
    selectedStream = null;
    age = 10;
    isSwitchOn = false;
    notifyListeners();
  }

  void checked(int index) {
    selectedIndex = index;
    isShowData = false;
    txtNameController.text = data[index]['Name'];
    txtDivController.text = data[index]['Div'];
    txtRollController.text = data[index]['Roll'];
    gender = data[index]['Gender'];
    checkGender(gender.toString());
    hobby = data[index]['Hobby'];

    for (var element in data[index]['Hobby']) {
      if (element == 'cricket') {
        isCricker = true;
      }
      if (element == 'football') {
        isFootBall = true;
      }
    }
    selectedStream = data[index]['Stream'];
    age = data[index]['Age'];
    isSwitchOn = data[index]['Switch'];
    notifyListeners();
  }

  void deleteData() {
    isShowData = true;
    notifyListeners();
  }

  void updateData() {
    isShowData = true;
    hobbyData();
    data[selectedIndex]['Name'] = txtNameController.text;
    data[selectedIndex]['Div'] = txtDivController.text;
    data[selectedIndex]['Roll'] = txtRollController.text;
    data[selectedIndex]['Gender'] = gender;
    data[selectedIndex]['Hobby'] = hobby;
    data[selectedIndex]['Stream'] = selectedStream;
    data[selectedIndex]['Age'] = age;
    data[selectedIndex]['Switch'] = isSwitchOn;
    notifyListeners();
  }

  void hobbyData() {
    hobby.clear();
    isCricker == true ? hobby.add('cricket') : hobby.remove('cricket');
    isFootBall == true ? hobby.add('football') : hobby.remove('football');
  }

  void checkstream(String value) {
    isShowData = true;
    notifyListeners();
  }

  void isslider(int value) {
    isShowData = false;
    notifyListeners();
  }

  void isswitchOn(bool value) {
    isShowData = false;
    isSwitchOn = value;
    notifyListeners();
  }

  void isswitchOff(bool value) {
    isShowData = false;
    isSwitchOn = value;
    notifyListeners();
  }

  void showData() {
    isShowData = true;
    notifyListeners();
  }

  void checkSwitch(bool value) {
    isShowData = false;
    isSwitchOn = value;
    notifyListeners();
  }

  void checkCricket(bool value) {
    isShowData = false;
    isCricker = value;
    isCricker == true ? hobby.add('cricket') : hobby.remove('cricket');
    notifyListeners();
  }

  void checkFootBall(bool value) {
    isShowData = false;
    isFootBall = value;
    isFootBall == true ? hobby.add('football') : hobby.remove('football');
    notifyListeners();
  }

  void checkGender(String value) {
    isShowData = false;
    gender = value;
    notifyListeners();
  }

  void checkSlider(double value) {
    isShowData = false;
    age = value;
    notifyListeners();
  }

  void checkStream(String value) {
    isShowData = false;
    selectedStream = value;
    notifyListeners();
  }
}
