import 'package:flutter/material.dart';

double _itemHeight = 60;
double _paddingValue = 5;


class PurchaseItem extends StatefulWidget {
  String itemName;
  int price;
  PurchaseItem({
    required this.itemName,
    required this.price,
    Key? key
  }) : super(key: key);

  @override
  _PurchaseItemState createState() => _PurchaseItemState();
}

class _PurchaseItemState extends State<PurchaseItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.redAccent,
      padding: EdgeInsets.all(_paddingValue),
      height: _itemHeight,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.lightBlueAccent,
            width: 4
          ),
          color: Colors.lightBlue,
          borderRadius: BorderRadius.all(Radius.circular(_itemHeight/4)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              widget.itemName,
              style: TextStyle(fontSize: _itemHeight/4, fontWeight: FontWeight.w600),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(widget.price.toString()),
          )
        ],
      ),


    );
  }
}
