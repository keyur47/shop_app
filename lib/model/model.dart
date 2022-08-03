class UserData {
  // String name;
  // String time;
  // String isDate;
  List<Data>? data;

  UserData({
    // required this.name,
    // required this.time,
    // required this.isDate,
    this.data,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      // name: json["name"],
      // time: json["time"],
      // isDate: json["isDate"],
        data: json['data'].cast<String>());
  }

  Map<String, dynamic> toJson() {
    return {
      // "name": name,
      // "time": time,
      // "isDate": isDate,
      "data": data,
    };
  }
}

class Data {
  String? name;
  String? product;
  int? price;
  int? quantity;
  int? total;
  String? time;
  String? isDate;

  Data({this.name, this.time, this.isDate,this.price,this.quantity,this.total,this.product});

  factory Data.fromJson(Map<String, dynamic> json){
    return Data(
      name: json["name"],
      product: json["product"],
      price: json["price"],
      quantity: json["quantity"],
      total: json["total"],
      time: json["time"],
      isDate: json["isDate"],
    );
  }


  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "product": product,
      "price": price,
      "quantity": quantity,
      "total": total,
      "time": time,
      "isDate": isDate,
    };
  }

}