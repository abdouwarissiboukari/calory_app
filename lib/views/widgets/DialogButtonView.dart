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

  showBirthdayPicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: context.watch<DataProvider>().initialDate,
      firstDate: DateTime(1970),
      lastDate: DateTime(2023, 3),
    ).then((value) =>
        {if (value != null) context.read<DataProvider>().setAge(value!)});
  }
}
