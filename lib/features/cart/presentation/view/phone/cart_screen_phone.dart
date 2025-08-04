import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_store/Core/constants/app_colors.dart';
import 'package:tech_store/features/auth/presentation/widgets/drawer.dart';
import 'package:tech_store/features/cart/presentation/providers/providers.dart';
import 'package:tech_store/features/cart/presentation/widgets/phone/cart_list_view.dart';
import 'package:tech_store/features/cart/presentation/widgets/phone/infos_container.dart';
import 'package:tech_store/shared/widgets/app_bar.dart';
class CartScreenPhone extends ConsumerWidget {
  const CartScreenPhone({super.key});

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
            child: Padding(
              padding: const EdgeInsets.only(left: 15,right: 15,
              top: 25,bottom: 25),
              
              child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Shopping Cart',style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                  ),),
                  SizedBox(height: 20,),
                  InfosContainer(),
                  SizedBox(height: 20,),
                  CartListView(cart: cart,)

                ],
              ),
            ),
          ),
        );
      }
    );
  }
}
