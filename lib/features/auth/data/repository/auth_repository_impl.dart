import 'package:tech_store/features/auth/data/datasources/remote_data_source.dart';
import 'package:tech_store/features/auth/data/models/login_model.dart';
import 'package:tech_store/features/auth/domain/entities/login.dart';
import 'package:tech_store/features/auth/domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<void> login(Login loginEntity) {
    final loginModel = LoginModel.fromEntity(loginEntity);
    return remoteDataSource.postLogin(loginModel);
  }
}
