import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_store/Core/constants/app_colors.dart';
import 'package:tech_store/features/auth/presentation/widgets/drawer.dart';
import 'package:tech_store/features/cart/presentation/providers/providers.dart';
import 'package:tech_store/features/cart/presentation/widgets/phone/cart_list_view.dart';
import 'package:tech_store/features/cart/presentation/widgets/phone/infos_container.dart';
import 'package:tech_store/features/cart/presentation/widgets/tablet/cart_list_view_tablet.dart';
import 'package:tech_store/features/cart/presentation/widgets/tablet/infos_container_tablet.dart';
import 'package:tech_store/shared/widgets/app_bar.dart';
import 'package:tech_store/shared/widgets/help_and_support.dart';
class CartScreenTablet extends ConsumerWidget {
  const CartScreenTablet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartState=ref.watch(cartViewModelProvider);
    return cartState.when(
        loading: ()=>const Center(child: CircularProgressIndicator(color: AppColors.blueComponents,)),
        error: (error,stackTrace)=>Center(child: Text('failed to fetch cart')),
        data: (cart){
          return Scaffold(
            appBar: AppBarCostume(),
            drawer: DrawerCostume(),
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15,right: 15,
                        top: 25,bottom: 25),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Shopping Cart',style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600
                        ),),
                        SizedBox(height: 50,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width*0.45,
                                child: Column(
                                  children: [
                                    CartListViewTablet(cart: cart,),
                                    SizedBox(height: 20,),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15.0,right: 15),
                                      child: OutlinedButton(onPressed: (){},child: Text('Continue Shopping',style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.IconsBg,
                                      ),),
                                      style: OutlinedButton.styleFrom(
                                        side: BorderSide(color: AppColors.IconsBg,width: 2),
                                        minimumSize: Size(double.infinity, 50),

                                      )
                                      ),
                                    ),
                                    SizedBox(height: 20,),
                                    Visibility(
                                      visible: cart.items.isNotEmpty,
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 15.0,right: 15),
                                        child: ElevatedButton(onPressed: (){
                                          ref.read(cartViewModelProvider.notifier).clearCart();
                                        },
                                            style: ElevatedButton.styleFrom(
                                               minimumSize: Size(double.infinity, 50),
                                              backgroundColor: Colors.black
                                      
                                            ), child:const Text('Clear Shopping Cart',style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          color:Colors.white,
                                        ),)
                                        ),
                                      ),
                                    ),


                                  ],
                                )),
                            SizedBox(
                                width: MediaQuery.of(context).size.width*0.45,
                                child: InfosContainerTablet()),
                          ],
                        ),





                      ],
                    ),
                  ),
                  HelpAndSupport()
                ],
              ),
            ),
          );
        }
    );
  }
}
