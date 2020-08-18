import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:phone_market/model/advertisement.dart';
import 'package:phone_market/model/order_product.dart';
import 'package:phone_market/model/product.dart';
import 'package:phone_market/model/user.dart';
import 'package:phone_market/services/cloud_database.dart';

class CloudService implements CloudDatabase {
  Firestore _firestore = Firestore.instance;
  List<OrderProduct> listOrderProduct;

  @override
  Future<List<Advertisement>> bringAdvertisement() async {
    List<Advertisement> allAds;

    QuerySnapshot querySnapshot = await _firestore
        .collection("advertisement")
        .limit(2)
        .orderBy("advertisementContent", descending: true)
        .getDocuments();
    allAds = List<Advertisement>();
    for (DocumentSnapshot documentSnapshot in querySnapshot.documents) {
      Advertisement advertisement =
          Advertisement.fromMap(documentSnapshot.data);
      allAds.add(advertisement);
    }
    return allAds;
  }

  @override
  Future<List<Product>> bringProduct() async {
    List<Product> allProducts = List<Product>();
    // TODO: implement bringProduct
    QuerySnapshot snapshot =
        await _firestore.collection("phones").getDocuments();

    for (DocumentSnapshot documentSnapshot in snapshot.documents) {
      Product product = Product.fromMap(documentSnapshot.data);
      allProducts.add(product);
    }
    return allProducts;
  }

  @override
  Future<bool> saveOrderProduct(User user, OrderProduct orderProduct) async {
    print(user.userId.toString());
    await _firestore
        .collection("orders")
        .document(user.userId + orderProduct.orderProductName)
        .setData(orderProduct.toMap());
    return true;
    // TODO: implement saveOrderProduct
  }

  @override
  Future<List<OrderProduct>> bringOrderProduct() async {
    listOrderProduct = [];
    QuerySnapshot snapshot =
        await _firestore.collection("orders").getDocuments();

    for (DocumentSnapshot documentQuery in snapshot.documents) {
      OrderProduct orderProduct = OrderProduct.fromMap(documentQuery.data);
      listOrderProduct.add(orderProduct);
    }

    return listOrderProduct;
  }

  @override
  Future<bool> removeTheOrderProduct(String userId, String productName) async {
    await _firestore
        .collection("orders")
        .document(userId + productName)
        .delete();

    return true;
  }

  @override
  Future<List<Product>> bringOrderProductbySearching(
      String productName) async {
    // TODO: implement bringOrderProductbySearching
    List<Product> searchingProduct = [];
    QuerySnapshot snapshot = await _firestore
        .collection("phones")
        .where("searchCode", isEqualTo: productName)
        .getDocuments();
    for (DocumentSnapshot documentSnapshot in snapshot.documents) {
      Product product = Product.fromMap(documentSnapshot.data);
      print(product.productName.toString());
      searchingProduct.add(product);
    }
    return searchingProduct;
  }
}
