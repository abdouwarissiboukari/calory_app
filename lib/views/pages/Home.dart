import 'package:calory_app/services/DataProvier.dart';
import 'package:calory_app/views/widgets/CalculateButton.dart';
import 'package:calory_app/views/widgets/CustomAppBar.dart';
import 'package:calory_app/views/widgets/InfoTextView.dart';
import 'package:calory_app/views/widgets/formCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          CustomAppBar(titleString: context.watch<DataProvider>().appBarTitle),
      body: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 15, bottom: 8, left: 8, right: 8),
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InfoTextView(),
                FormCard(
                  controller: controller,
                ),
                CalculateButton(),
              ],
            ),
          )),
    );
  }
}
