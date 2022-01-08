import 'package:finance_app/controller/app_data.dart';
import 'package:flutter/material.dart';
class TotalView extends StatelessWidget {
  TotalView({Key? key}) : super(key: key);

  final int _totalCost = AppData.getTotalCost();
  final double _height = 100;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(4.0),
        height: _height,
        child: Align(
          alignment: Alignment.center,
          child: Text("Total Expense: $_totalCost",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: _height/4,
              color: Colors.white,
            ),
          ),
        ),
        decoration: BoxDecoration(
            border: Border.all(),
            color: Colors.black54,
            borderRadius: BorderRadius.all(Radius.circular(_height/4))
        ),
      ),
    );
  }
}
