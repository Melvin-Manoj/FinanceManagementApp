class Item {

  String data;
  int price;
  Item({
    required this.data,
    required this.price,
  });

  String getData() => data;
  int getPrice() => price;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    data: json['data'],
    price: json['price'],
  );

  Map<String, dynamic> toJson() => {
    'data': data,
    'price' : price,
  };

}