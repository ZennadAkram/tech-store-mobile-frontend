import 'package:flutter/material.dart';

import 'package:tech_store/features/auth/presentation/widgets/drawer.dart';
import 'package:tech_store/features/auth/presentation/widgets/login_credentiels_container.dart';
import 'package:tech_store/features/auth/presentation/widgets/signup_container.dart';
import 'package:tech_store/shared/widgets/app_bar.dart';
class PhoneAuthScreen extends StatelessWidget {
  const PhoneAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCostume(),
      drawer: DrawerCostume(),
      body: Padding(padding: EdgeInsetsGeometry.all(20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Customer Login',style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),),
            SizedBox(height: 20,),
            LoginContainer(),
            SizedBox(height: 20,),
            SignupContainer()
          ],
        ),
      ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
