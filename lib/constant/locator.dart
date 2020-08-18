import 'package:get_it/get_it.dart';
import 'package:phone_market/repository/myRepository.dart';
import 'package:phone_market/services/cloud_service.dart';
import 'package:phone_market/services/fake_authentication_service.dart';

GetIt locator=GetIt.instance;

void setupLocater(){
  locator.registerLazySingleton(() => FakeAuthenticationService());
  locator.registerLazySingleton(() => MyRepository());
  locator.registerLazySingleton(() => CloudService());
}