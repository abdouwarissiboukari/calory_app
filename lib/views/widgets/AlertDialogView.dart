import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/DataProvier.dart';
import 'AlertContentView.dart';

class AlertDialogView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isValidate = context.watch<DataProvider>().isValidate;

    return AlertDialog(
      title: Text(
        (isValidate) ? "Votre besoin en calorie" : "Erreur",
        textAlign: TextAlign.center,
      ),
      titleTextStyle: TextStyle(
        fontSize: 16,
        color: context.watch<DataProvider>().appPramaryColor,
      ),
      content: (isValidate)
          ? AlertContentView()
          : const Text("Tous les champs ne sont pas remplit"),
      actions: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: ElevatedButton(
            onPressed: (() => Navigator.of(context).pop()),
            child: const Text("OK"),
          ),
        ),
      ],
    );
  }
}
