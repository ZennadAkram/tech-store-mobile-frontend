import 'package:flutter/material.dart';
import 'package:tech_store/features/auth/presentation/view/phone/phone_auth_screen.dart';
import 'package:tech_store/features/auth/presentation/view/tablet/tablet_auth_screen.dart';
import 'package:tech_store/shared/responsive/responsive_layout.dart';
class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(phone: PhoneAuthScreen() , tablet: TabletAuthScreen());
  }
}
