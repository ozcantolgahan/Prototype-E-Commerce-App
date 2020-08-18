import 'package:flutter/cupertino.dart';

class Product {
  String productId;
  String productName;
  String searchCode;
  String productContent;
  String productPrice;
  String productImage;

  Product(
      {@required this.productId,
      @required this.productName,
      this.searchCode,
      @required this.productContent,
      @required this.productPrice,
      @required this.productImage});

  Product.fromMap(Map<String, dynamic> map) {
    productId = map["productId"];
    productName = map["productName"];
    searchCode = map["searchCode"];
    productContent = map["productContent"];
    productPrice = map["productPrice"];
    productImage = map["productImage"];
  }
}
