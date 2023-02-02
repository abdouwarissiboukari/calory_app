import 'package:flutter/cupertino.dart';

class TextView extends StatelessWidget {
  String text;
  Color color;
  double? fontSizeValue;

  TextView(
      {super.key,
      required this.text,
      required this.color,
      required this.fontSizeValue});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(color: color, fontSize: fontSizeValue),
    );
  }
}
