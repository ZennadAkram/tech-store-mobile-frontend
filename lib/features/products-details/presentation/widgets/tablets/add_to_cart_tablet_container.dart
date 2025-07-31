import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tech_store/Core/constants/app_colors.dart';
import 'package:tech_store/features/products-details/domain/entities/cart.dart';
import 'package:tech_store/features/products-details/domain/entities/product_detailed.dart';
import 'package:tech_store/features/products-details/presentation/viewmodel/product_detail_providers.dart';
import 'package:tech_store/shared/providers/appbar_provider.dart';

class AddToCartTabletContainer extends ConsumerWidget {
  final ProductDetailed product;
  const AddToCartTabletContainer(this.product, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentColor = ref.watch(currentColorProvider);
    final currentVersion = ref.watch(currentVersionProvider);
    final quantity = ref.watch(quantityProvider);

    return Expanded(
      child: Container(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Price Container
            Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'On Sale from',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 5),
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

            // Buttons Row
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Quantity Selector
                    Container(
                      width: 70,
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppColors.grayBg,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            quantity.toString(),
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Material(
                                color: AppColors.grayBg,
                                child: InkWell(
                                  onTap: () {
                                    ref.read(quantityProvider.notifier).increase(
                                        product.stock == null
                                            ? product.versions![currentVersion].stock
                                            : product.stock!);
                                  },
                                  child: Icon(
                                    Icons.keyboard_arrow_up_outlined,
                                    color: AppColors.IconsBg,
                                    size: 18,
                                  ),
                                ),
                              ),
                              Material(
                                color: AppColors.grayBg,
                                child: InkWell(
                                  onTap: () {
                                    ref.read(quantityProvider.notifier).decrease();
                                  },
                                  child: Icon(
                                    Icons.keyboard_arrow_down_outlined,
                                    size: 18,
                                    color: AppColors.IconsBg,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Add to Cart Button
                    Flexible(
                      flex: 4,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: ElevatedButton(
                          onPressed: () {
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
                                inputColorId: product
                                    .versions![currentVersion].colors?[currentColor].id,
                                productId: product.id,
                              );
                            }
                            ref.read(cartViewModelProvider.notifier).addToCart(cart);
                            ref.read(appBarUserProvider).getCartCount();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Product added to cart'),
                              ),
                            );
                          },
                          child: Text(
                            'Add to cart',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.blueComponents,
                            minimumSize: const Size(0, 50), // Fixed height
                          ),
                        ),
                      ),
                    ),

                    // PayPal Button
                    Flexible(
                      flex: 3,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: SvgPicture.asset('assets/icons/paypal.svg'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.yellowPaypal,
                          minimumSize: const Size(0, 50), // Fixed height
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}