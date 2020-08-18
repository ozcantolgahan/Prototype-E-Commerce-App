import 'package:flutter/material.dart';
import 'package:phone_market/constant/locator.dart';
import 'package:phone_market/model/advertisement.dart';
import 'package:phone_market/model/user.dart';
import 'package:phone_market/screens/landing_page.dart';
import 'package:phone_market/viewmodel/data_view_model.dart';
import 'package:phone_market/viewmodel/user_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  setupLocater();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserViewModel>(
      create: (context)=>UserViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LandingPage(),
      ),
    );
  }
}
