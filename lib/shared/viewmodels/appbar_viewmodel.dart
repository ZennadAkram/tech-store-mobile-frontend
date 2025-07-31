import 'package:flutter/cupertino.dart';
import 'package:tech_store/Core/network/private_dio.dart';
import 'package:tech_store/shared/models/app_bar_user_model.dart';

class AppBarUserViewmodel extends ChangeNotifier {
  AppBarUserModel _user = AppBarUserModel.empty();
  int _cartCount = 0;
  bool _isLoading = false;
  String? _errorMessage;

  // Getters for safe access
  AppBarUserModel get user => _user;
  int get cartCount => _cartCount;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> getCartCount() async {
    try {
      _setLoading(true);
      final response = await PrivateDio.dio.get('/cart/items/count/');
      _cartCount = response.data['total_items'] ?? 0;
      _errorMessage = null;
    } catch (e) {
      _errorMessage = "Couldn't load cart count";
      _cartCount = 0;
    } finally {
      _setLoading(false);
    }
  }

  Future<void> loadUserData() async {
    try {
      _setLoading(true);
      final response = await PrivateDio.dio.get('/me/');
      _user = AppBarUserModel.fromJson(response.data);
      _errorMessage = null;
    } catch (e) {
      _errorMessage = "Couldn't load user data";
      _user = AppBarUserModel.empty();
    } finally {
      _setLoading(false);
    }
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  Future<void> initializeData() async {
    await Future.wait([
      loadUserData(),
      getCartCount(),
    ]);
  }
}