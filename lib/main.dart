import 'package:finance_app/views/add_item.dart';
import 'package:finance_app/views/add_item_fab.dart';
import 'package:finance_app/views/item_list.dart';
import 'package:finance_app/views/total_view.dart';
import 'package:flutter/material.dart';

import 'controller/app_data.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await AppData.initEvent();
  runApp(const HomePage());
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  refresh(){
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "finance app",
      home: Scaffold(
        appBar: AppBar(
          elevation: 0.5,
          centerTitle: true,
          title: const Text(
            "FinanceApp",
            style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white
            ),
          ),
        ),
        body: Column(
          children: [
            TotalView(),
            Expanded(child: ItemListView(notifyParent: refresh,)),
          ],
        ),
        floatingActionButton: const AddItemFAB(),
      ),
    );
  }
}
