import 'package:tech_store/features/auth/domain/entities/login.dart';

class LoginModel{
  String userName;
  String password;
  LoginModel(this.userName, this.password);
  Map<String, dynamic> toJson() {
    return {
      'username': userName,
      'password': password,
    };
  }
  factory LoginModel.fromEntity(Login entity) {
    return LoginModel(entity.userName, entity.password);
  }
}
