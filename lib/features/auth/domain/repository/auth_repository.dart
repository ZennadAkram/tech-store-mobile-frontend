import 'package:tech_store/features/auth/domain/entities/login.dart';

abstract class AuthRepository{
    Future<void> login(Login logins);
}