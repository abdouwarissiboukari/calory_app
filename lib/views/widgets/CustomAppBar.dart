import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  String titleString;

  CustomAppBar({super.key, required this.titleString})
      : super(title: Text(titleString));
}
