import 'package:calory_app/services/DataProvier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WeightTextField extends StatelessWidget {
  TextEditingController controller;
  WeightTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    controller.text = context.watch<DataProvider>().poids.toInt().toString();
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, right: 5, left: 5),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          labelText: "Entrez votre poids en kilos",
        ),
        onChanged: (value) {
          context.read<DataProvider>().setPoids(double.parse(
              (controller.text.isNotEmpty) ? controller.text : "0"));
        },
      ),
    );
  }
}
