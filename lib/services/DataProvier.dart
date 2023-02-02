import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DataProvider with ChangeNotifier {
  String appBarTitle = "Calcul de calorie";
  String infoString =
      "Remplissez tous les champs pour obtenir votre besoin journalier en calories";
  String ageButtonText = "";

  MaterialColor appPramaryColor = Colors.grey;
  Color womanColor = Colors.white;
  Color manColor = Colors.white;
  int manOrWoman = 1;
  bool switchValue = true;
  DateTime initialDate = DateTime.now();
  DateTime SelectedDate = DateTime.now();
  int age = 0;

  DataProvider() {
    setAppColor(true);
    setAge(SelectedDate);
  }

  setAppColor(bool colorType) {
    (colorType)
        ? appPramaryColor = Colors.green
        : appPramaryColor = Colors.pink;

    manOrWoman = (colorType) ? 1 : 0;

    if (manOrWoman == 1) {
      womanColor = Colors.black;
      manColor = Colors.green;
    } else {
      womanColor = Colors.pink;
      manColor = Colors.black;
    }
    notifyListeners();
  }

  setWicthValue(bool sValue) {
    switchValue = sValue;
    setAppColor(sValue);

    notifyListeners();
  }

  setAge(DateTime dateTime) {
    if (dateTime.second == DateTime.now().second) {
      age = 0;
      ageButtonText = "Votre age";
    } else if (dateTime.second > DateTime.now().second) {
      age = 0;
      ageButtonText = "Date incorrecte";
    } else {
      age = dateTime.year - initialDate.year;
      SelectedDate = dateTime;
      ageButtonText = "Votre age est $age";
    }

    notifyListeners();
  }
}
