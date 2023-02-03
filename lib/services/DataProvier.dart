import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DataProvider with ChangeNotifier {
  String appBarTitle = "Calcul de calorie";
  String infoString =
      "Remplissez tous les champs pour obtenir votre besoin journalier en calories";
  String ageButtonText = "Votre âge";
  String tailleText = "Votre taille est : ";

  MaterialColor appPramaryColor = Colors.grey;
  Color womanColor = Colors.white;
  Color manColor = Colors.white;
  int manOrWoman = 1;
  bool switchValue = true;
  int age = 0;
  double taille = 0;
  double poids = 0;

  DataProvider() {
    setAppColor(true);
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

  setAge(DateTime initialDate, DateTime selectedDate) {
    if (selectedDate.second >= initialDate.second) {
      age = 0;
      ageButtonText = "Date incorrecte";
    } else {
      age = initialDate.year - selectedDate.year;
      ageButtonText = "Votre age est $age";
    }

    notifyListeners();
  }

  setTaille(double newTaille) {
    taille = newTaille;
    tailleText = "Votre taille est : ${taille.toInt()}";

    notifyListeners();
  }

  setPoids(double newPoids) {
    poids = newPoids;
    notifyListeners();
  }
}
