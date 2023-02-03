import 'package:calory_app/services/DataProvier.dart';
import 'package:calory_app/views/widgets/DialogButtonView.dart';
import 'package:calory_app/views/widgets/SizeSliderView.dart';
import 'package:calory_app/views/widgets/SportRadioView.dart';
import 'package:calory_app/views/widgets/SwitchView.dart';
import 'package:calory_app/views/widgets/TextView.dart';
import 'package:calory_app/views/widgets/WeightTextField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormCard extends StatelessWidget {
  TextEditingController controller;
  FormCard({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.65,
      margin: const EdgeInsets.only(bottom: 15),
      child: Card(
        elevation: 8,
        child: Padding(
          padding: const EdgeInsets.only(top: 15, bottom: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextView(
                    text: "Femme",
                    color: context.watch<DataProvider>().womanColor,
                    fontSizeValue: 14,
                  ),
                  SwitchView(),
                  TextView(
                    text: "Homme",
                    color: context.watch<DataProvider>().manColor,
                    fontSizeValue: 14,
                  )
                ],
              ),
              DialogButtonView(),
              SizeSliderView(),
              WeightTextField(
                controller: controller,
              ),
              SportRadioView(),
            ],
          ),
        ),
      ),
    );
  }
}
