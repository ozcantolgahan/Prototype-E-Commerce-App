import 'package:phone_market/model/user.dart';

abstract class AuthenticationBase{
  Future<User> currentUser();
}