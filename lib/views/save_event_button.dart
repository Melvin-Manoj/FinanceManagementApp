import 'package:finance_app/controller/app_data.dart';
import 'package:finance_app/main.dart';
import 'package:flutter/material.dart';

import '../item_model.dart';


class SaveEventFAB extends StatelessWidget {
  final String eventLabel;
  final int eventPrice;

  const SaveEventFAB({
    Key? key,
    required this.eventLabel,
    required this.eventPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.black,
      onPressed: () {
        if(eventLabel.isNotEmpty){
          AppData.addEvent(Item(
            data: eventLabel,
            price: eventPrice,
          ));
          print("button pressed");
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => const HomePage()));
        }
      },
      child: const Icon(
        Icons.check,
        color: Colors.white,
      ),
    );
  }
}