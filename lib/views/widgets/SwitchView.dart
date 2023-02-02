import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../services/DataProvier.dart';

class SwitchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: context.watch<DataProvider>().switchValue,
      onChanged: ((value) => context.read<DataProvider>().setWicthValue(value)),
      activeColor: context.watch<DataProvider>().manColor,
      activeTrackColor: context.watch<DataProvider>().manColor,
      inactiveTrackColor: context.watch<DataProvider>().womanColor,
      inactiveThumbColor: context.watch<DataProvider>().womanColor,
    );
  }
}
