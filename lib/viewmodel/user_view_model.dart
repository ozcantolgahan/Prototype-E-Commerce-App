import 'package:flutter/cupertino.dart';
import 'package:phone_market/constant/locator.dart';
import 'package:phone_market/model/user.dart';
import 'package:phone_market/repository/myRepository.dart';
import 'package:phone_market/services/authentication_base.dart';

enum Progress { Idle, Busy }

class UserViewModel with ChangeNotifier implements AuthenticationBase {
  MyRepository _myRepository = locator<MyRepository>();
  Progress _progress = Progress.Idle;
  User _user;

  User get user => _user;

  Progress get progress => _progress;

  set progress(Progress value) {
    _progress = value;
    notifyListeners();
  }

  UserViewModel() {
    currentUser();
  }

  @override
  Future<User> currentUser() async {
    try {
      progress = Progress.Busy;
      _user = await _myRepository.currentUser();

      return _user;
    } finally {
      progress = Progress.Idle;
    }
  }
}
