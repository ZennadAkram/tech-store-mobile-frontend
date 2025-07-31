import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginState {
  final bool userNameRed;
  final bool passwordRed;
  final AsyncValue<void> result;

  const LoginState({
    required this.userNameRed,
    required this.passwordRed,
    required this.result,
  });

  LoginState copyWith({
    bool? userNameRed,
    bool? passwordRed,
    AsyncValue<void>? result,
  }) {
    return LoginState(
      userNameRed: userNameRed ?? this.userNameRed,
      passwordRed: passwordRed ?? this.passwordRed,
      result: result ?? this.result,
    );
  }

  factory LoginState.initial() => const LoginState(
    userNameRed: false,
    passwordRed: false,
    result: AsyncData(null),
  );
}
