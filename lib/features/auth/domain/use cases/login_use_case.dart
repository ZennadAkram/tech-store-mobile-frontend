import 'package:tech_store/features/auth/domain/entities/login.dart';
import 'package:tech_store/features/auth/domain/repository/auth_repository.dart';

class LoginUseCase{
  final AuthRepository authRepository;
  LoginUseCase(this.authRepository);
  Future<void> call(Login logins){
    return authRepository.login(logins);
  }

}