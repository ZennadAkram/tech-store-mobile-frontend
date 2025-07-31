import 'package:flutter/material.dart';
import 'package:tech_store/Core/constants/app_colors.dart';
import 'package:tech_store/features/products-details/domain/entities/product_detailed.dart';
import 'package:tech_store/features/products-details/presentation/widgets/tablets/add_to_cart_tablet_container.dart';
import 'package:tech_store/features/products-details/presentation/widgets/tablets/tab_bars_container.dart';
class TabBarAndAddToCartContainer extends StatelessWidget {
  final ProductDetailed product;
  const TabBarAndAddToCartContainer({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
          border: Border(bottom: BorderSide(
            width: 1,
            color: AppColors.labelColor

          ),

          ),

      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ConstrainedBox(

              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.35,
              ),
              child: TabBarsContainer()),
          AddToCartTabletContainer(product),
        ],
      ),

    );
  }
}
