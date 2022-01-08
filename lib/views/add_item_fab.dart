import 'package:flutter/material.dart';

import 'add_item.dart';
class AddItemFAB extends StatelessWidget {
  const AddItemFAB({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => FloatingActionButton(
          child: const Icon(
            Icons.add,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => const AddItem()));
          }
      ),
    );
  }
}
