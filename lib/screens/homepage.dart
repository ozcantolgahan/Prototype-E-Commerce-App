import 'dart:async';

import 'package:flutter/material.dart';
import 'package:phone_market/model/product.dart';
import 'package:phone_market/screens/order_product_page.dart';
import 'package:phone_market/screens/phone_page.dart';

import 'package:phone_market/viewmodel/data_view_model.dart';
import 'package:phone_market/viewmodel/user_view_model.dart';
import 'package:phone_market/widgets/banner_widget.dart';
import 'package:phone_market/widgets/phones_list_widget.dart';

import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;
  PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final _advertisementViewModel = Provider.of<DataViewModel>(context);
    final _userViewModel = Provider.of<UserViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Phone Market",
              style: TextStyle(
                color: Color(0xFF333333),
              )),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
          actions: <Widget>[
            _advertisementViewModel.allOrderProduct.length == 0
                ? IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => OrderProductPage(
                                allProduct: _advertisementViewModel,
                                userId: _userViewModel.user.userId,
                              ),
                          fullscreenDialog: true));
                    },
                    color: Color(0xFF333333),
                  )
                : IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => OrderProductPage(
                                allProduct: _advertisementViewModel,
                                userId: _userViewModel.user.userId,
                              ),
                          fullscreenDialog: true));
                    },
                    color: Colors.orange,
                  )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              BannerWidget(
                  advertisementViewModel: _advertisementViewModel,
                  pageController: _pageController),
              PhonesList(advertisementViewModel: _advertisementViewModel)
            ],
          ),
        ));
  }
}
