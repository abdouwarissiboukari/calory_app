import 'package:calory_app/services/DataProvier.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class InfoTextView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      child: Text(
        context.watch<DataProvider>().infoString,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
