import 'package:flutter/material.dart';
import 'package:tech_store/features/auth/presentation/widgets/drawer.dart';
import 'package:tech_store/features/auth/presentation/widgets/login_credentiels_container.dart';
import 'package:tech_store/features/auth/presentation/widgets/signup_container.dart';
import 'package:tech_store/shared/widgets/app_bar.dart';
import 'package:tech_store/shared/widgets/help_and_support.dart';
class TabletAuthScreen extends StatelessWidget {
  const TabletAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBarCostume(),
      drawer: DrawerCostume(),
      body: SingleChildScrollView(
        child: ConstrainedBox(
          
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          
          child: IntrinsicHeight(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
            
                    children: [
                      Text('Customer Login',style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),),
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: screenWidth*0.45,
                                child: LoginContainer()),
            
                            SizedBox(
                                width: screenWidth*0.45,
                                child: SignupContainer())
                          ],
                        ),
            
                    ],
                  ),
                ),
                HelpAndSupport()
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
