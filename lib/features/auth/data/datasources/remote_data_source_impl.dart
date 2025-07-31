
import 'package:tech_store/Core/network/public_dio.dart';
import 'package:tech_store/Core/network/token_storage.dart';
import 'package:tech_store/features/auth/data/datasources/remote_data_source.dart';
import 'package:tech_store/features/auth/data/models/login_model.dart';

class RemoteDataSourceImpl implements RemoteDataSource{
  @override
  Future<void> postLogin(LoginModel logins)  async {
    try {
      final response = await PublicDio.dio.post(
        '/login/',
        data: logins.toJson(),
      );

      final accessToken = response.data['access'];
      final refreshToken = response.data['refresh'];


      await TokenStorage.saveTokens(accessToken, refreshToken);

      print("✅ Login Successful!");
      print("Access Token: $accessToken");
      print("Refresh Token: $refreshToken");
    } catch (e) {
      print("❌ Login Failed: $e");
    }
  }
}