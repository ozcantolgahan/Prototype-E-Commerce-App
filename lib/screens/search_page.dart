import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_market/model/order_product.dart';
import 'package:phone_market/screens/searched_phones.dart';
import 'package:phone_market/viewmodel/data_view_model.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController searchString;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchString = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchString.clear();
  }

  @override
  Widget build(BuildContext context) {
    final _dataViewModel = Provider.of<DataViewModel>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Phone Market",
              style: TextStyle(
                color: Color(0xFF333333),
              )),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Form(
                key: _formKey,
                child: Container(
                  padding: EdgeInsets.all(12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        height: MediaQuery.of(context).size.height * 0.05,
                        child: TextFormField(
                          controller: searchString,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "Write Something like Samsung"),
                        ),
                      ),
                      IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {
                            var productCode = searchString.text
                                .replaceAll(" ", "")
                                .toLowerCase();

                            _dataViewModel
                                .bringOrderProductbySearching(productCode);

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SearchedPhone(
                                          allProduct:
                                              _dataViewModel.allSearchedProduct,
                                        ),
                                    fullscreenDialog: true));
                          })
                    ],
                  ),
                ),
              ),
              Text(
                "Best Sellers",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 8,),
              Row(
                children: <Widget>[
                  Text("iPhone",style: TextStyle(fontSize: 16),),
                  SizedBox(width: 8,),
                  Icon(Icons.star,color: Colors.orange,),
                  Icon(Icons.star,color: Colors.orange,),
                  Icon(Icons.star,color: Colors.orange,),
                  Icon(Icons.star,color: Colors.orange,),
                  Icon(Icons.star_half,color: Colors.orange,)
                ],
              ),
              Row(
                children: <Widget>[
                  Text("Samsung",style: TextStyle(fontSize: 16),),
                  SizedBox(width: 8,),
                  Icon(Icons.star,color: Colors.orange,),
                  Icon(Icons.star,color: Colors.orange,),
                  Icon(Icons.star,color: Colors.orange,),
                  Icon(Icons.star,color: Colors.orange,),

                ],
              )
            ],
          ),
        ));
  }
}
