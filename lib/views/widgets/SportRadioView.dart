import 'package:calory_app/services/DataProvier.dart';
import 'package:calory_app/views/widgets/TextView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SportRadioView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextView(
          text: "Quelle est votre activité sportive?",
          color: context.watch<DataProvider>().appPramaryColor,
          fontSizeValue: 14,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            radioItem(titleText: "Faible", value: 0, context: context),
            radioItem(titleText: "Modere", value: 1, context: context),
            radioItem(titleText: "Forte", value: 2, context: context),
          ],
        )
      ],
    );
  }

  Widget radioItem({
    required String titleText,
    required int value,
    required BuildContext context,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      mainAxisSize: MainAxisSize.min,
      children: [
        Radio(
          value: value,
          groupValue: context.watch<DataProvider>().radioGroupValue,
          onChanged: ((newValue) {
            context.read<DataProvider>().setActivite(newValue!);
          }),
        ),
        TextView(
          text: titleText,
          color: context.watch<DataProvider>().appPramaryColor,
          fontSizeValue: 14,
        ),
      ],
    );
  }
}
