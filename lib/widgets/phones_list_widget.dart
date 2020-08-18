import 'package:flutter/material.dart';
import 'package:phone_market/model/order_product.dart';
import 'package:phone_market/model/product.dart';
import 'package:phone_market/screens/phone_page.dart';
import 'package:phone_market/viewmodel/data_view_model.dart';
import 'package:phone_market/viewmodel/user_view_model.dart';
import 'package:provider/provider.dart';

class PhonesList extends StatelessWidget {
  const PhonesList({
    Key key,
    @required DataViewModel advertisementViewModel,
  })
      : _advertisementViewModel = advertisementViewModel,
        super(key: key);

  final DataViewModel _advertisementViewModel;

  @override
  Widget build(BuildContext context) {
    final _productViewModel = Provider.of<DataViewModel>(context);
    final _userViewModel = Provider.of<UserViewModel>(context);

    return Container(
      margin: EdgeInsets.only(top: 4),
      width: MediaQuery
          .of(context)
          .size
          .width,
      height: MediaQuery
          .of(context)
          .size
          .height * 0.65,
      child: FutureBuilder<List<Product>>(
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Product> allProduct = snapshot.data;
            print(allProduct.length);
            if (_advertisementViewModel.adsProgress == AdsProgress.Idle) {
              return GridView.count(
                crossAxisCount: 2,
                children: List.generate(allProduct.length, (index) {
                  return Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(color: Color(0xFFE3F2FD), spreadRadius: 3),
                      ],
                    ),
                    child: Stack(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                                margin: EdgeInsets.only(top: 4),
                                height:
                                MediaQuery
                                    .of(context)
                                    .size
                                    .height * 0.15,
                                child: Image(
                                  image: NetworkImage(
                                      allProduct[index].productImage),
                                  fit: BoxFit.fill,
                                )),
                            Center(child: Text(allProduct[index].productName)),
                            Text(
                              allProduct[index].productPrice + " \$",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        Positioned(
                          right: 0,
                          child: Column(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(
                                  Icons.info,
                                  color: Colors.orange,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PhonePage(
                                                phoneName: allProduct[index]
                                                    .productName,
                                                phoneContent: allProduct[index]
                                                    .productContent,
                                                phoneImage: allProduct[index]
                                                    .productImage,
                                                phonePrice: allProduct[index]
                                                    .productPrice,
                                              )));
                                },
                              ),
                              IconButton(
                                icon: Icon(
                                  Icons.shopping_basket,
                                  color: Colors.orange,
                                ),
                                onPressed: () {
                                  Future<bool> result =
                                  _productViewModel.saveOrderProduct(
                                      _userViewModel.user,
                                      OrderProduct(
                                          orderProductName:
                                          allProduct[index].productName,
                                          orderProductImage:
                                          allProduct[index]
                                              .productImage,
                                          orderProductPrice:
                                          allProduct[index]
                                              .productPrice));
                                  result.then(
                                          (value) {
                                        showSuccesDialog(context);
                                        _advertisementViewModel
                                            .bringOrderProduct();

                                      });
                                },
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
        future: _advertisementViewModel.bringProduct(),
      ),
    );
  }

  showSuccesDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(
              title: Text("Success Added to Card",
                style: TextStyle(color: Colors.green),),
              content: Icon(Icons.done, color: Colors.green, size: 50,),

            ));
  }
}
