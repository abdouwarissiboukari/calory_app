import 'package:calory_app/services/DataProvier.dart';
import 'package:calory_app/views/widgets/TextView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SizeSliderView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 10, right: 5, left: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextView(
              text: context.watch<DataProvider>().tailleText,
              color: context.watch<DataProvider>().appPramaryColor,
              fontSizeValue: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              TextView(
                  text: "0",
                  color: context.watch<DataProvider>().appPramaryColor,
                  fontSizeValue: 14),
              Expanded(
                child: Slider(
                  min: 0,
                  max: 220,
                  value: context.watch<DataProvider>().taille,
                  onChanged: (value) =>
                      context.read<DataProvider>().setTaille(value),
                ),
              ),
              TextView(
                  text: "220",
                  color: context.watch<DataProvider>().appPramaryColor,
                  fontSizeValue: 14)
            ],
          )
        ],
      ),
    );
  }
}
