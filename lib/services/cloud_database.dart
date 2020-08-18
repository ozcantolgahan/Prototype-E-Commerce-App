import 'package:phone_market/model/advertisement.dart';
import 'package:phone_market/model/order_product.dart';
import 'package:phone_market/model/product.dart';
import 'package:phone_market/model/user.dart';

abstract class CloudDatabase {
  Future<List<Advertisement>> bringAdvertisement();

  Future<List<Product>> bringProduct();
  Future<bool> saveOrderProduct(User user,OrderProduct orderProduct);
  Future<List<OrderProduct>> bringOrderProduct();
  Future<bool> removeTheOrderProduct(String userId,String productName);
  Future<List<Product>> bringOrderProductbySearching(String productName);
}
