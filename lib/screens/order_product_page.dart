import 'package:flutter/material.dart';
import 'package:phone_market/model/order_product.dart';
import 'package:phone_market/viewmodel/data_view_model.dart';
import 'package:provider/provider.dart';

class OrderProductPage extends StatefulWidget {
  DataViewModel allProduct;
  String userId;

  OrderProductPage({@required this.allProduct, @required this.userId});

  @override
  _OrderProductPageState createState() => _OrderProductPageState();
}

class _OrderProductPageState extends State<OrderProductPage> {
  @override
  Widget build(BuildContext context) {
    List<OrderProduct> allProduct = widget.allProduct.allOrderProduct;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Your Order"),
      ),
      body: Container(
        padding: EdgeInsets.all(18),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(allProduct[index].orderProductName),
              leading: Image.network(allProduct[index].orderProductImage),
              subtitle: Text(
                allProduct[index].orderProductPrice + " \$",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: Icon(
                Icons.remove_circle,
                color: Colors.orange,
              ),
              onTap: () {
                widget.allProduct
                    .removeTheOrderProduct(
                        widget.userId, allProduct[index].orderProductName)
                    .then((value) {
                  setState(() {
                    allProduct.removeAt(index);
                  });
                });
              },
            );
          },
          itemCount: widget.allProduct.allOrderProduct.length,
        ),
      ),
    );
  }
}
