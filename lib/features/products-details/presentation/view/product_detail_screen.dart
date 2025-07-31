import 'package:flutter/material.dart';
import 'package:tech_store/features/products-details/presentation/view/phone/product_detail_phone_screen.dart';
import 'package:tech_store/features/products-details/presentation/view/tablet/product_detail_tablet_screen.dart';
import 'package:tech_store/shared/responsive/responsive_layout.dart';
class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      phone: ProductDetailScreenPhone(),
      tablet: ProductDetailScreenTablet(),
    );
  }
}
