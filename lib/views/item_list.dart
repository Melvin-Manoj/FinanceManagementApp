import 'package:finance_app/controller/app_data.dart';
import 'package:finance_app/views/item_view.dart';
import 'package:flutter/material.dart';

class ItemListView extends StatefulWidget {
  const ItemListView({Key? key}) : super(key: key);

  @override
  _ItemListViewState createState() => _ItemListViewState();
}

class _ItemListViewState extends State<ItemListView> {

  var itemList = AppData.getItems();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              // color: Colors.blueAccent,
            ),
            color: Colors.blueGrey,
            borderRadius: const BorderRadius.all(Radius.circular(8))
        ),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: itemList.length,
          itemBuilder: (BuildContext context, int index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: PurchaseItem(
                  itemName: itemList[index].getData(),
                  price: itemList[index].getPrice()
              ),
            );
          }),
      ),
    );
  }
}
