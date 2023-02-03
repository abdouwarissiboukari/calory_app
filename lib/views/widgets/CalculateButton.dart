import 'package:calory_app/services/DataProvier.dart';
import 'package:calory_app/views/widgets/AlertContentView.dart';
import 'package:calory_app/views/widgets/AlertDialogView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculateButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        ElevatedButton(
          onPressed: (() {
            context.read<DataProvider>().formValidation();
            context.read<DataProvider>().calculeCalorie();
            resultDisplay(context);
          }),
          child: const Text("Calculer"),
        ),
      ],
    );
  }

  Future<void> resultDisplay(BuildContext context) async {
    await showDialog(
        context: context, builder: ((context) => AlertDialogView()));
  }
}
