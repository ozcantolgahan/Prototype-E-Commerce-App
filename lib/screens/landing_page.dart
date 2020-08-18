import 'package:flutter/material.dart';
import 'package:phone_market/screens/nav_bottom_page.dart';
import 'package:phone_market/screens/sign_in_page.dart';
import 'package:phone_market/viewmodel/data_view_model.dart';
import 'package:phone_market/viewmodel/user_view_model.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _userViewModel = Provider.of<UserViewModel>(context);
    if (_userViewModel.progress == Progress.Idle) {
      if (_userViewModel.user == null) {
        return SignInPage();
      } else {

        return ChangeNotifierProvider<DataViewModel>(
            create: (context) => DataViewModel(), child: NavBottomPage());
      }
    } else {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
  }
}
