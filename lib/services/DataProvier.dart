import 'package:calory_app/services/DataPreferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DataProvider with ChangeNotifier {
  String appBarTitle = "Calcul de calorie";
  String infoString =
      "Remplissez tous les champs pour obtenir votre besoin journalier en calories";
  String ageButtonText = "Votre âge";
  String tailleText = "Votre taille est : 0";

  MaterialColor appPramaryColor = Colors.grey;
  Color womanColor = Colors.white;
  Color manColor = Colors.white;
  int manOrWoman = 1;
  bool switchValue = true;
  bool isValidate = true;

  int age = 0;
  int radioGroupValue = 1;

  double taille = 0;
  double poids = 0;
  double activite = 1.5;
  double valeurCalory = 0;
  double valeurCalorySport = 0;

  DateTime initialDate = DateTime.now();

  DataProvider() {
    getPreferencesData();
  }

  getPreferencesData() async {
    final initData = await DataPrefernces().getData();
    switchValue = initData["switchValue"];
    age = initData["age"];
    radioGroupValue = initData["radioGroupValue"];
    taille = initData["taille"];
    poids = initData["poids"];
    activite = initData["activite"];

    ageButtonText = "Votre age est de $age";
    tailleText = "Votre taille est : ${taille.toInt()} cm";

    setAppColor(switchValue);
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

  setAge(DateTime selectedDate) {
    if (selectedDate.second >= DateTime.now().second) {
      age = 0;
      ageButtonText = "Date incorrecte";
    } else {
      age = DateTime.now().year - selectedDate.year;
      ageButtonText = "Votre age est $age";
      initialDate = selectedDate;
    }

    notifyListeners();
  }

  setTaille(double newTaille) {
    taille = newTaille;
    tailleText = "Votre taille est : ${taille.toInt()} cm";

    notifyListeners();
  }

  setPoids(double newPoids) {
    poids = newPoids;
    notifyListeners();
  }

  setActivite(int value) {
    radioGroupValue = value;
    switch (radioGroupValue) {
      case 0:
        activite = 1.2;
        break;
      case 1:
        activite = 1.5;
        break;
      case 2:
        activite = 1.8;
        break;
      default:
        activite = 0;
    }

    notifyListeners();
  }

  setPreferencesData() async {
    await DataPrefernces().setData(
        switchValue: switchValue,
        age: age,
        radioGroupValue: radioGroupValue,
        poids: poids,
        activite: activite,
        taille: taille);
  }

  calculeCalorie() {
    if (isValidate) {
      if (manOrWoman == 1) {
        valeurCalory =
            66.4730 + (13.7516 * poids) + (5.0033 * taille) - (6.7550 * age);
        valeurCalorySport = valeurCalory * activite;
      } else {
        valeurCalory =
            655.0955 + (9.5634 * poids) + (1.8496 * taille) - (4.6756 * age);
        valeurCalorySport = valeurCalory * activite;
      }
      setPreferencesData();
    } else {
      valeurCalory = 0;
      valeurCalorySport = 0;
    }
    notifyListeners();
  }

  formValidation() {
    isValidate = true;

    if (age == 0 || taille == 0 || poids == 0) isValidate = false;

    notifyListeners();
  }
}
