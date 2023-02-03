import 'dart:ffi';

import 'package:calory_app/services/DataProvier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DialogButtonView extends StatelessWidget {
  DateTime initialDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    initialDate = context.watch<DataProvider>().initialDate;
    return ElevatedButton(
        onPressed: (() => showBirthdayPicker(context)),
        child: Text(context.watch<DataProvider>().ageButtonText));
  }

  Future<void> showBirthdayPicker(BuildContext context) async {
    await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1970),
      lastDate: DateTime(2023, 3),
      cancelText: "Annuler".toUpperCase(),
      locale: const Locale('fr'),
      initialDatePickerMode: DatePickerMode.year,
    ).then((value) {
      if (value != null) {
        context.read<DataProvider>().setAge(value);
      }
    });
  }
}
