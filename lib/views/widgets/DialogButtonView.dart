import 'dart:ffi';

import 'package:calory_app/services/DataProvier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DialogButtonView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: (() => showBirthdayPicker(context)),
        child: Text(context.watch<DataProvider>().ageButtonText));
  }

  Future<void> showBirthdayPicker(BuildContext context) async {
    DateTime initialDate = DateTime.now();
    await showDatePicker(
            context: context,
            initialDate: initialDate,
            firstDate: DateTime(1970),
            lastDate: DateTime(2023, 3),
            cancelText: "Annuler".toUpperCase(),
            locale: const Locale('fr'))
        .then((value) => {
              if (value != null)
                context.read<DataProvider>().setAge(initialDate, value)
            });
  }
}
