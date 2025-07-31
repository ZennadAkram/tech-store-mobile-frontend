import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_store/features/auth/domain/entities/login.dart';
import 'package:tech_store/features/auth/domain/use%20cases/login_use_case.dart';

class LoginController extends StateNotifier<AsyncValue<void>> {
  final LoginUseCase loginUseCase;

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  LoginController(this.loginUseCase) : super(const AsyncData(null));
   bool userNameRed=false;
   bool passwordRed=false;
  Future<void> login() async {
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();
    if (username.isEmpty) {
      userNameRed=true;
      return;
    }
    if (password.isEmpty) {
      passwordRed=true;
      return;
    }
    state = const AsyncLoading();

    try {
      await loginUseCase(Login(username, password));
      state = const AsyncData(null);
    } catch (e, st) {
      userNameRed=true;
      passwordRed=true;
      state = AsyncError(e, st);
    }
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
