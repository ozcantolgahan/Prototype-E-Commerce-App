import 'package:phone_market/constant/locator.dart';
import 'package:phone_market/model/advertisement.dart';
import 'package:phone_market/model/order_product.dart';
import 'package:phone_market/model/product.dart';
import 'package:phone_market/model/user.dart';
import 'package:phone_market/services/authentication_base.dart';
import 'package:phone_market/services/cloud_service.dart';
import 'package:phone_market/services/fake_authentication_service.dart';

enum AppMode { Debug, Release }

class MyRepository implements AuthenticationBase {
  FakeAuthenticationService _fakeAuthenticationService =
      locator<FakeAuthenticationService>();
  CloudService _cloudService = locator<CloudService>();
  AppMode _appMode = AppMode.Debug;

  @override
  Future<User> currentUser() async {
    // TODO: implement currentUser
    if (_appMode == AppMode.Debug) {
      return await _fakeAuthenticationService.currentUser();
    } else {
      return null;
    }
  }

  Future<List<Advertisement>> bringAdvertisement() async {
    if (_appMode == AppMode.Debug) {
      return await _cloudService.bringAdvertisement();
    } else {
      return [];
    }
  }

  Future<List<Product>> bringProduct() async {
    if (_appMode == AppMode.Debug) {
      return await _cloudService.bringProduct();
    } else {
      return [];
    }
  }

  Future saveOrderProduct(User user, OrderProduct orderProduct) async {
    await _cloudService.saveOrderProduct(user, orderProduct);
  }

  Future<List<OrderProduct>> bringOrderProduct() async {
    if (_appMode == AppMode.Debug) {
      return await _cloudService.bringOrderProduct();
    } else {
      return [];
    }
  }

  Future<bool> removeTheOrderProduct(String userId, String productName) async {
    if (_appMode == AppMode.Debug) {
      return await _cloudService.removeTheOrderProduct(userId, productName);
    } else {
      return false;
    }
  }

  Future<List<Product>> bringOrderProductbySearching(
      String productName) async {
    if (_appMode == AppMode.Debug) {
      return await _cloudService.bringOrderProductbySearching(productName);
    } else {
      return [];
    }
  }
}
