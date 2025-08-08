import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:tech_store/Core/constants/app_colors.dart';
import 'package:tech_store/features/cart/presentation/providers/providers.dart';
class CartCheckoutTablet extends ConsumerWidget {
  const CartCheckoutTablet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm=ref.watch(cartViewModelProvider);

    return Container(
      margin: EdgeInsets.only(bottom: 20),
      width: double.infinity,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.containerBg,
      ),
      constraints: BoxConstraints(
        minHeight: 150,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Order Summary',style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600
          )     ),
          SizedBox(height: 30,),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: AppColors.labelColor,width: 1)
                )
            ),


          ),
          SizedBox(height: 20,),
          vm.when( error: (error, stackTrace) => Center(
            child: Row(
              children: [
                Text('the cart is empty'),
                SizedBox(width: 10,),
                Icon(Icons.shopping_cart_outlined,color: AppColors.labelColor,)
              ],
            ),
          )
              , loading: () => Center(
                child: CircularProgressIndicator(color: AppColors.blueComponents),
              )
              ,data: (cart){
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(cart.items.length.toString(),style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: AppColors.blueComponents
                        )),
                        SizedBox(width: 10,),
                        Text('Items in Cart',style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: AppColors.darkGrey
                        )),
                      ],
                    ),
                    SizedBox(height: 20,),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: cart.items.length,
                        itemBuilder: (context,index){
                          return Column(
                            children: [
                              Row(

                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CachedNetworkImage(imageUrl: cart.items[index].product_poster_image ?? cart.items[index].version_details!.images?[0].image ?? "",
                                    placeholder: (context, url) => CircularProgressIndicator(),
                                    errorWidget: (context, url, error) => Icon(Icons.broken_image),
                                    width: 110,
                                    height: 110,
                                    fit: BoxFit.fill,),
                                  SizedBox(width: 20,),
                                  SizedBox(
                                    height: 110,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [

                                            SizedBox(
                                              width: MediaQuery.of(context).size.width*0.21,
                                              child: Text(cart.items[index].product_description+"MSI MEG Trident X 10SD-1012AU Intel i7 10700K, 2070 SUPER, 32GB RAM, 1TB SSD, Windows 10 Home, Gaming Keyboard and Mouse 3 Years Warranty",maxLines: 3,overflow: TextOverflow.ellipsis,style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w600

                                              )),
                                            ),


                                            Row(
                                              children: [
                                                Text('Qty',style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600,
                                                    color: AppColors.IconsBg
                                                )),
                                                SizedBox(width: 3,),
                                                Text(cart.items[index].quantity.toString(),style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w600
                                                )),
                                                SizedBox(width: 17,),
                                                Text('\$'+((cart.items[index].product_starting_price?.toDouble() ?? cart.items[index].version_details!.price as double)*cart.items[index].quantity).toStringAsFixed(2),style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w600,

                                                )),
                                                SizedBox(width: 3,),

                                              ],
                                            )
                                          ]
                                      ),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(height: 20,),



                            ],
                          );
                        }),
                  ],
                );
              }
          )


        ],
      ),
    );
  }
}
