import 'package:finance_app/views/save_event_button.dart';
import 'package:flutter/material.dart';


class AddItem extends StatefulWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  State<AddItem> createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  String itemName = "";
  int itemPrice = 0;

  @override
  Widget build(BuildContext context) {
    print("reached here");
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
            top: 100,
            bottom: 30,
          ),
          child: Column(
              children: [
                const Text(
                  'Add expense',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      hintText: 'Item of expense',
                    ),
                    onChanged: (val){
                      setState(() {
                        itemName = val;
                      });
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: TextFormField(
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'price',
                    ),
                    onChanged: (val){
                      setState(() {
                        itemPrice = int.parse(val);
                      });
                    },
                  ),
                ),
              ]
          ),
        ),
      ),
      floatingActionButton: SaveEventFAB(
          eventLabel: itemName,
          eventPrice: itemPrice,
      ),
    );
  }
}