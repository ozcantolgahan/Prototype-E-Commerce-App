import 'package:phone_market/model/user.dart';
import 'package:phone_market/services/authentication_base.dart';

class FakeAuthenticationService implements AuthenticationBase{
  @override
  Future<User> currentUser() async{
    // TODO: implement currentUser
   return await Future.value(User(userId: "123456789",email: "user@gmail.com"));
  }

}