import 'package:flutter/material.dart';
import 'package:tech_store/Core/constants/app_colors.dart';
class SignupContainer extends StatelessWidget {
  const SignupContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 20,bottom: 20,left: 15,right: 15),
        decoration: BoxDecoration(
            color: AppColors.grayBg

        ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('New Customer?',style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,)),
          SizedBox(height: 20,),
          Text(
            'Creating an account has many benefits:\n\n\n'
                '•  Check out faster\n'
                '•  Keep more than one address\n'
                '•  Track orders and more',
            style: TextStyle(fontSize: 14,fontWeight: FontWeight.w300),),
          SizedBox(height: 20,),
          ElevatedButton(onPressed:() {} ,child: Padding(
            padding: const EdgeInsets.only(top: 12,bottom: 12,left: 20,right: 20),
            child: Text('Create An Account',style: TextStyle(

                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.white
            ),),
          ),
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.blueComponents
            ),
          ),


        ],
      ),
    );
  }
}
