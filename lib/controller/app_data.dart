import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../item_model.dart';

// List<Item> globalEventList = [];


class AppData {
  static List<Item> _itemList = [
    Item(data: "Milk", price: 50),
    Item(data: "paper" , price: 70),
    Item(data: "dettol", price: 501),
    Item(data: "tables" , price: 7770),
  ];
  static late SharedPreferences _sharedPreferences;
  static late List<String> _jsonItemList = [];

  static getTotalCost(){
    int _total = 0;

    for(var i = 0; i < _itemList.length; i++){
      _total = _total + _itemList[i].price;
    }
    return _total;
  }

  static Future<void> initEvent() async {
    _sharedPreferences = await SharedPreferences.getInstance();

    final _tempJsonEventList = _sharedPreferences.getStringList('todoList');

    if(_tempJsonEventList != null){
      _jsonItemList = _tempJsonEventList;
      _itemList = _tempJsonEventList.map((json) => Item.fromJson(jsonDecode(json))).toList();
    }
  }

  static Future<void> addEvent(event) async {
    _itemList.add(event);
    _jsonItemList.add(jsonEncode(event));

    await _sharedPreferences.setStringList('purchaseList', _jsonItemList);
  }

  static List<Item> getItems() {
    return _itemList;
  }

  static Future<void> saveEvents() async {
    _jsonItemList = _itemList.map((event) => jsonEncode(event)).toList();
    await _sharedPreferences.setStringList('purchaseList', _jsonItemList);
  }
}