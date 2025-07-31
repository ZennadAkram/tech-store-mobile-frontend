import 'package:tech_store/features/auth/data/models/login_model.dart';

abstract class RemoteDataSource{
  Future<void> postLogin(LoginModel logins);
}