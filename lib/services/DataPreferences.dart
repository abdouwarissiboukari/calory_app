import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataPrefernces {
  final String keySwitchValue = "switchValue";
  final String keyAge = "age";
  final String keyRadioGroupValue = "radioGroupValue";
  final String keyPoids = "poids";
  final String keyActivite = "activite";
  final String keyTaille = "taille";

  Future<void> setData({
    required bool switchValue,
    required int age,
    required int radioGroupValue,
    required double poids,
    required double activite,
    required double taille,
  }) async {
    final dataPrefs = await SharedPreferences.getInstance();
    dataPrefs.setBool(keySwitchValue, switchValue);
    dataPrefs.setInt(keyAge, age);
    dataPrefs.setInt(keyRadioGroupValue, radioGroupValue);
    dataPrefs.setDouble(keyPoids, poids);
    dataPrefs.setDouble(keyActivite, activite);
    dataPrefs.setDouble(keyTaille, taille);
  }

  Future<Map<String, dynamic>> getData() async {
    Map<String, dynamic> map = Map();
    final dataPrefs = await SharedPreferences.getInstance();
    map = {
      keySwitchValue: dataPrefs.getBool(keySwitchValue) ?? true,
      keyAge: dataPrefs.getInt(keyAge) ?? 0,
      keyRadioGroupValue: dataPrefs.getInt(keyRadioGroupValue) ?? 1,
      keyPoids: dataPrefs.getDouble(keyPoids) ?? 0.0,
      keyActivite: dataPrefs.getDouble(keyActivite) ?? 1.5,
      keyTaille: dataPrefs.getDouble(keyTaille) ?? 0.0,
    };

    return map;
  }
}
