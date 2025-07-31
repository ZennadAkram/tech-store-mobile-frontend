import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_store/Core/constants/app_colors.dart';
import 'package:tech_store/features/auth/presentation/viewmodels/auth_providers.dart';
class LoginContainer extends ConsumerWidget {
  const LoginContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginController = ref.watch(loginControllerProvider.notifier);
    final loginState = ref.watch(loginControllerProvider);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 20,bottom: 20,left: 15,right: 15),
      decoration: BoxDecoration(
        color: AppColors.grayBg

      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text('Registered Customers',style: TextStyle(
        fontSize: 18,
            fontWeight: FontWeight.w600,

      )),
          SizedBox(height: 20,),
          Text('If you have an account, sign in with your email address.',style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w300,


          ),),
          SizedBox(height: 20,),
          Row(
            children: [
              Text('username',style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),),
              Text(' *',style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: Colors.red

              ))
            ],
          ),
          SizedBox(height: 10,),
          Container(
            color: Colors.white,
            height: 50,
            child: TextFormField(
              maxLines: 1,
            controller: loginController.usernameController,
              decoration: InputDecoration(
                hintText: 'Enter your username',
                hintStyle: TextStyle(
                  color: AppColors.IconsBg,
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                  borderSide: BorderSide(
                    color:AppColors.IconsBg,
                    width: 1,
                  )

                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(
                      color:AppColors.IconsBg,
                      width: 1,
                    )

                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                    borderSide: BorderSide(
                      color:AppColors.IconsBg,
                      width: 1,
                    ))
              ),
            ),
          ),


          SizedBox(height: 20,),
          Row(
            children: [
              Text('password',style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),),
              Text(' *',style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.red

              )),
            ],

          ),
          SizedBox(height: 10,),
          Container(
            color: Colors.white,
            height: 50,
            child: TextFormField(
              obscureText: true,
              maxLines: 1,
             controller: loginController.passwordController,
              decoration: InputDecoration(
                  hintText: 'Enter your password',
                  hintStyle: TextStyle(
                    color: AppColors.IconsBg,
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(
                        color:AppColors.IconsBg,
                        width: 1,
                      )

                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(
                        color:AppColors.IconsBg,
                        width: 1,
                      )

                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(
                        color:AppColors.IconsBg,
                        width: 1,
                      ))
              ),
            ),
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              loginState.isLoading
                  ? const CircularProgressIndicator()
              :ElevatedButton(onPressed: () => loginController.login(), child: Padding(
                padding: const EdgeInsets.only(top: 12,bottom: 12,left: 20,right: 20),
                child: Text('Submit',style: TextStyle(

                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Colors.white
                ),),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.blueComponents
              ),
              ),
              SizedBox(width: 10,),
              TextButton(onPressed: () {  }, child: Text('Forgot Password?',style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w400,
                color: AppColors.blueComponents
              ),))
            ],
          )

        ],
      )
    );
  }
}
