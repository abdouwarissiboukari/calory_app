import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../services/DataProvier.dart';

class AlertContentView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final caloryBase = context.watch<DataProvider>().valeurCalory.toInt();
    final calorySport = context.watch<DataProvider>().valeurCalorySport.toInt();
    return Container(
      padding: const EdgeInsets.only(top: 10),
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text("Votre besoin de base est de : $caloryBase"),
          Text("Votre besoin en activité sportive est de : $calorySport"),
        ],
      ),
    );
  }
}
