import 'package:flutter/material.dart';
import 'package:phone_market/model/order_product.dart';
import 'package:phone_market/model/product.dart';
import 'package:phone_market/viewmodel/data_view_model.dart';
import 'package:phone_market/viewmodel/user_view_model.dart';
import 'package:provider/provider.dart';

class SearchedPhone extends StatefulWidget {
  List<Product> allProduct;

  SearchedPhone({@required this.allProduct});

  @override
  _SearchedPhoneState createState() => _SearchedPhoneState();
}

class _SearchedPhoneState extends State<SearchedPhone> {
  @override
  Widget build(BuildContext context) {
    final _productViewModel = Provider.of<DataViewModel>(context);
    final _userViewModel = Provider.of<UserViewModel>(context);

    try {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
        ),
        body: Container(
          padding: EdgeInsets.all(18),
          child:widget.allProduct.length==0?Center(child: Text("Not Found"),): ListView.builder(
            itemBuilder: (context, index) => ListTile(
              title: Text(widget.allProduct[index].productName),
              subtitle: Text(
                widget.allProduct[index].productPrice + " \$",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              leading: Image(
                image: NetworkImage(widget.allProduct[index].productImage),
              ),
              trailing: Icon(
                Icons.shopping_cart,
                color: Colors.orange,
              ),
              onTap: () {
                Future<bool> result = _productViewModel.saveOrderProduct(
                    _userViewModel.user,
                    OrderProduct(
                        orderProductName: widget.allProduct[index].productName,
                        orderProductImage:
                            widget.allProduct[index].productImage,
                        orderProductPrice:
                            widget.allProduct[index].productPrice));
                result.then((value) {
                  showSuccesDialog(context);
                  _productViewModel.bringOrderProduct();
                });
              },
            ),
            itemCount: widget.allProduct.length,
          ),
        ),
      );
    } catch (e) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }

  showSuccesDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(
                "Success Added to Card",
                style: TextStyle(color: Colors.green),
              ),
              content: Icon(
                Icons.done,
                color: Colors.green,
                size: 50,
              ),
            ));
  }
}
