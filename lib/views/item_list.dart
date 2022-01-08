import 'package:finance_app/controller/app_data.dart';
import 'package:finance_app/views/item_view.dart';
import 'package:flutter/material.dart';

class ItemListView extends StatefulWidget {
  const ItemListView({Key? key}) : super(key: key);

  @override
  _ItemListViewState createState() => _ItemListViewState();
}

class _ItemListViewState extends State<ItemListView> {

  //widget that creates the red background when an item is slided right.
  Widget slideRightBackground() {
    return Container(
      color: Colors.red,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const <Widget>[
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            Text(
              " Delete",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.left,
            ),
          ],
        ),
        alignment: Alignment.centerLeft,
      ),
    );
  }

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
            color: Colors.white60,
            borderRadius: const BorderRadius.all(Radius.circular(8))
        ),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: itemList.length,
          itemBuilder: (BuildContext context, int index){
            return Dismissible(
              key: UniqueKey(),
              child: InkWell(
                onTap: (){
                  print("$index clicked");
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: PurchaseItem(
                      itemName: itemList[index].getData(),
                      price: itemList[index].getPrice()
                  ),
                ),
              ),
              background: slideRightBackground(),

              confirmDismiss: (direction) async {
                if (direction == DismissDirection.startToEnd) {
                  bool res = false;
                  await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          content: Text(
                              "Are you sure you want to delete ${AppData
                                  .getItemAt(index)}?"),
                          actions: <Widget>[
                            TextButton(
                              child: const Text(
                                "Cancel",
                                style: TextStyle(color: Colors.black),
                              ),
                              onPressed: () {
                                res = false;
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: const Text(
                                "Delete",
                                style: TextStyle(color: Colors.red),
                              ),
                              onPressed: () {
                                // TODO: Delete the item from DB etc..
                                print("deleted the item ${AppData.getItemAt(
                                    index)}");
                                setState(() {

                                  AppData.deleteEvent(index);
                                });
                                print("set state ended");
                                res = true;
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      });
                  return res;
                }
              }

            );
          }),
      ),
    );
  }
}
