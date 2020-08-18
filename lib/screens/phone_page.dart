import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_market/model/order_product.dart';
import 'package:phone_market/viewmodel/data_view_model.dart';
import 'package:phone_market/viewmodel/user_view_model.dart';
import 'package:provider/provider.dart';

class PhonePage extends StatefulWidget {
  String phoneName;
  String phoneContent;
  String phoneImage;
  String phonePrice;

  PhonePage(
      {this.phoneName, this.phoneContent, this.phoneImage, this.phonePrice});

  @override
  _PhonePageState createState() => _PhonePageState();
}

class _PhonePageState extends State<PhonePage> {
  bool _added = false;

  @override
  Widget build(BuildContext context) {
    final _productViewModel = Provider.of<DataViewModel>(context);
    final _userViewModel = Provider.of<UserViewModel>(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: Image(
                          image: NetworkImage(widget.phoneImage),
                          fit: BoxFit.fill,
                        ),
                      ),
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Text(
                              widget.phoneName,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Price: " + widget.phonePrice + " \$",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            RaisedButton(
                              onPressed: () {
                                Future<bool> result =
                                    _productViewModel.saveOrderProduct(
                                        _userViewModel.user,
                                        OrderProduct(
                                            orderProductName: widget.phoneName,
                                            orderProductImage:
                                                widget.phoneImage,
                                            orderProductPrice:
                                                widget.phonePrice));
                                result.then((value) {
                                  setState(() {
                                    _added = value;
                                    showSuccesDialog(context);
                                    _productViewModel.bringOrderProduct();
                                  });
                                });
                              },
                              color: Colors.orange,
                              child: Text(
                                "Add to Cart",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            _added == false
                                ? Container()
                                : Row(
                                    children: <Widget>[
                                      Text("Added to Card"),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Icon(
                                        Icons.done,
                                        color: Colors.orange,
                                        size: 32,
                                      )
                                    ],
                                  )
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  widget.phoneName,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(widget.phoneContent),
              ],
            ),
          ),
        ),
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
