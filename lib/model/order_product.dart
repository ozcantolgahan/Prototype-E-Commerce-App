class OrderProduct {
  String orderProductName;
  String orderProductImage;
  String orderProductPrice;

  OrderProduct(
      {this.orderProductName, this.orderProductImage, this.orderProductPrice});

  Map<String, dynamic> toMap() {
    return {
      'orderProductName': orderProductName,
      'orderProductImage': orderProductImage,
      'orderProductPrice': orderProductPrice,
    };
  }

  OrderProduct.fromMap(Map<String, dynamic> map) {
    orderProductName = map["orderProductName"];
    orderProductImage = map["orderProductImage"];
    orderProductPrice = map["orderProductPrice"];

  }
}
