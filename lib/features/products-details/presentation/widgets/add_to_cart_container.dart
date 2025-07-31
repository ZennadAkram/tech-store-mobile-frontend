import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tech_store/Core/constants/app_colors.dart';
import 'package:tech_store/features/products-details/domain/entities/cart.dart';
import 'package:tech_store/features/products-details/domain/entities/product_detailed.dart';
import 'package:tech_store/features/products-details/presentation/viewmodel/product_detail_providers.dart';
import 'package:tech_store/shared/providers/appbar_provider.dart';
class AddToCartContainer extends ConsumerWidget {
  final ProductDetailed product;
  const AddToCartContainer(this.product, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentColor=ref.watch(currentColorProvider);
    final currentVersion=ref.watch(currentVersionProvider);
    final screenWidth=MediaQuery.of(context).size.width;
    final quantity = ref.watch(quantityProvider);
    return Container(
      width: double.infinity,

      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,

        boxShadow: [
          BoxShadow(
            color: Color(0x00000024).withOpacity(0.14),
            spreadRadius: 0,
            blurRadius: 15,
            offset: Offset(0, 5), // changes position of shadow
          ),
        ]
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 70,
                  height: 50,
                  decoration: BoxDecoration(
                    color: AppColors.grayBg,
                    borderRadius: BorderRadius.circular(8)

                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(quantity.toString(),style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black

                      ),),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Material(
                            color: AppColors.grayBg,
                            child: InkWell(
                              onTap: () {
                                ref.read(quantityProvider.notifier).increase(product.stock == null ? product.versions![currentVersion].stock : product.stock!);
                              },
                              child: Icon(Icons.keyboard_arrow_up_outlined,color: AppColors.IconsBg, size: 18),
                            ),
                          ),
                          Material(
                            color: AppColors.grayBg,
                            child: InkWell(
                              onTap: () {
                                ref.read(quantityProvider.notifier).decrease();
                              },
                              child: Icon(Icons.keyboard_arrow_down_outlined, size: 18,color: AppColors.IconsBg),
                            ),
                          ),
                        ],
                      )

                      ])
                ),
                SizedBox(
                  width:screenWidth*0.35,

                  child: ElevatedButton( onPressed: () {
                    Cart cart;

                    if (product.versions == null) {
                      cart = Cart(
                        productId: product.id,
                        quantity: quantity,
                        cart: 9,
                      );
                    } else {
                      cart = Cart(
                        version: product.versions![currentVersion].id,
                        quantity: quantity,
                        cart: 9,
                        inputColorId: product.versions![currentVersion].colors?[currentColor].id,
                        productId: product.id,
                      );
                    }

                    ref.read(cartViewModelProvider.notifier).addToCart(cart);
                    ref.read(appBarUserProvider).getCartCount();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Product added to cart'),
                      ),
                    );
                  }, child: Padding(
                    padding: const EdgeInsets.only(top: 14,bottom: 14),
                    child: Text('Add to cart',style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white
                    )),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.blueComponents,

                  )),
                ),
                SizedBox(
                  width:screenWidth*0.35,

                  child: ElevatedButton(onPressed: (){}, child: Padding(
                    padding: const EdgeInsets.only(top: 14,bottom: 14),
                    child: SvgPicture.asset('assets/icons/paypal.svg')
                  ),
                      style: ElevatedButton.styleFrom(

                        backgroundColor: AppColors.yellowPaypal,

                      )),
                ),

              ],
            ),
            SizedBox(height: 10,),
           Container(
             width: double.infinity,
             decoration: BoxDecoration(
               color: AppColors.grayBg,
               borderRadius: BorderRadius.circular(8)

             ),
             child: Padding(
               padding: const EdgeInsets.all(15.0),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                   Text('On Sale from',style: TextStyle(
                     fontSize: 15,
                     fontWeight: FontWeight.w400,
                     color: Colors.black
                   ),),
                   SizedBox(width: 5,),
                   Text(
                     '${product.versions == null
                         ? (double.parse(product.startting_price) * quantity).toStringAsFixed(2)
                         : (double.parse(product.versions![currentVersion].price) * quantity).toStringAsFixed(2)} \$',
                     style: TextStyle(
                       fontSize: 15,
                       fontWeight: FontWeight.w700,
                       color: Colors.black,
                     ),
                   ),

                 ],
               ),
             ),


           )
          ],

        ),
      ),

    );
  }
}
