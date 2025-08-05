import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_store/Core/constants/app_colors.dart';
import 'package:tech_store/features/cart/domain/entities/cart.dart';
import 'package:tech_store/features/cart/domain/entities/cart_update.dart';
import 'package:tech_store/features/cart/presentation/providers/providers.dart';
import 'package:tech_store/shared/providers/appbar_provider.dart';
class CartListViewTablet extends ConsumerWidget {
  final Cart cart;
  const CartListViewTablet({super.key,required this.cart});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.read(cartViewModelProvider.notifier);
    final updateCart = ref.read(cartUpdateViewModelProvider.notifier);
    final quantityMap = ref.watch(quantityProvider);
    return Column(
      children: List.generate(cart.items.length,(index){

        quantityMap[cart.items[index].id] ??= cart.items[index].quantity;
        final quantity = quantityMap[cart.items[index].id];
        final price = (cart.items[index].product_starting_price?.toDouble()
            ?? (cart.items[index].version_details?.price as double?)) ?? 0;

        final total = price * (quantity ?? 1);

        return Container(
          margin: EdgeInsets.only(bottom: 30),
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(
                    color: AppColors.labelColor

                )
            ),

          ),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachedNetworkImage(imageUrl: cart.items[index].product_poster_image ?? cart.items[index].version_details!.images?[0].image ?? "",
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.broken_image),
                    width: 110,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(width: 10,),

                  Flexible(
                    child: Text(cart.items[index].product_description+"MSI MEG Trident X 10SD-1012AU Intel i7 10700K, 2070 SUPER, 32GB RAM, 1TB SSD, Windows 10 Home, Gaming Keyboard and Mouse 3 Years Warranty" ,maxLines: 3,overflow: TextOverflow.ellipsis,style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w400

                    )),
                  )


                ],
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Price',style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600

                        )),
                        SizedBox(height: 10,),
                        Text('\$${cart.items[index].product_starting_price ?? cart.items[index].version_details!.price}',style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600

                        ))
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Qty',style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600

                        )),

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
                                  Text('${quantityMap[cart.items[index].id]}',style: TextStyle(
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
                                            final maxStock = cart.items[index].version_details?.stock ?? cart.items[index].stock;

                                            updateCart.updateCart(CartUpdate(cart: cart.id, quantity:quantity!+1, productId: cart.items[index].product_id,version: cart.items[index].version_details?.id,inputColorId: cart.items[index].color_id), cart.items[index].id,);
                                            ref.read(quantityProvider.notifier).increase(cart.items[index].id, maxStock!);
                                            Future.microtask(() => viewModel.calculateSubTotal(ref.read(quantityProvider)));


                                          },
                                          child: Icon(Icons.keyboard_arrow_up_outlined,color: AppColors.IconsBg, size: 18),
                                        ),
                                      ),
                                      Material(
                                        color: AppColors.grayBg,
                                        child: InkWell(
                                          onTap: () {
                                            updateCart.updateCart(CartUpdate(cart: cart.id, quantity:quantity!-1, productId: cart.items[index].product_id,version: cart.items[index].version_details?.id,inputColorId: cart.items[index].color_id), cart.items[index].id,);
                                            ref.read(quantityProvider.notifier).decrease(cart.items[index].id);
                                            Future.microtask(() => viewModel.calculateSubTotal(ref.read(quantityProvider)));


                                          },
                                          child: Icon(Icons.keyboard_arrow_down_outlined, size: 18,color: AppColors.IconsBg),
                                        ),
                                      ),
                                    ],
                                  )

                                ])
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Subtotal',style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600

                        )),
                        SizedBox(height: 10,),
                        Text('${total.toStringAsFixed(2)}',style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600

                        ))
                      ],
                    ),
                    IconButton(
                        onPressed: (){
                          final itemId = cart.items[index].id;

                          // Remove item from cart
                          viewModel.deleteItem(itemId);

                          // ✅ Remove from QuantityViewModel
                          ref.read(quantityProvider.notifier).removeItem(itemId);

                          // Update cart count and subtotal
                          ref.read(appBarUserProvider).getCartCount();
                          Future.microtask(() => viewModel.calculateSubTotal(ref.read(quantityProvider)));                          }, icon: Icon(Icons.highlight_remove_sharp,size: 30,color: AppColors.labelColor,))
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
