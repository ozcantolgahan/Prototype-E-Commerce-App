import 'package:flutter/material.dart';
import 'package:phone_market/constant/locator.dart';
import 'package:phone_market/model/advertisement.dart';
import 'package:phone_market/model/order_product.dart';
import 'package:phone_market/model/product.dart';
import 'package:phone_market/model/user.dart';
import 'package:phone_market/repository/myRepository.dart';
import 'package:phone_market/services/cloud_database.dart';

enum AdsProgress { Idle, Busy }

class DataViewModel with ChangeNotifier implements CloudDatabase {
  MyRepository _myRepository = locator<MyRepository>();
  AdsProgress _adsProgress = AdsProgress.Idle;
  List<Advertisement> allAdvertisement;
  List<OrderProduct> allOrderProduct;
  List<Product> allSearchedProduct;
  List<Product> allProduct;

  AdsProgress get adsProgress => _adsProgress;

  set adsProgress(AdsProgress value) {
    _adsProgress = value;
  }

  DataViewModel() {
    bringOrderProduct();
  }

  @override
  Future<List<Advertisement>> bringAdvertisement() async {
    // TODO: implement bringAdvertisement
    try {
      adsProgress = AdsProgress.Busy;
      allAdvertisement = [];
      allAdvertisement = await _myRepository.bringAdvertisement();

      return allAdvertisement;
    } finally {
      adsProgress = AdsProgress.Idle;
    }
  }

  @override
  Future<List<Product>> bringProduct() async {
    try {
      adsProgress = AdsProgress.Busy;
      allProduct = List<Product>();
      allProduct = await _myRepository.bringProduct();

      return allProduct;
    } finally {
      adsProgress = AdsProgress.Idle;
    }
  }

  @override
  Future<bool> saveOrderProduct(User user, OrderProduct orderProduct) async {
    try {
      adsProgress = AdsProgress.Busy;
      await _myRepository.saveOrderProduct(user, orderProduct);
      return true;
    } finally {
      adsProgress = AdsProgress.Idle;
    }
  }

  @override
  Future<List<OrderProduct>> bringOrderProduct() async {
    try {
      adsProgress = AdsProgress.Busy;
      allOrderProduct = [];

      allOrderProduct = await _myRepository.bringOrderProduct();
      notifyListeners();

      return allOrderProduct;
    } finally {
      adsProgress = AdsProgress.Idle;
    }
  }

  @override
  Future<bool> removeTheOrderProduct(String userId, String productName) async {
    try {
      adsProgress = AdsProgress.Busy;

      return await _myRepository.removeTheOrderProduct(userId, productName);
    } finally {
      adsProgress = AdsProgress.Idle;
    }
  }

  @override
  Future<List<Product>> bringOrderProductbySearching(
      String productName) async {
    // TODO: implement bringOrderProductbySearching
    try {
      adsProgress = AdsProgress.Busy;

      allSearchedProduct =
          await _myRepository.bringOrderProductbySearching(productName);
      return allSearchedProduct;
    } finally {
      adsProgress = AdsProgress.Idle;
    }
  }
}
