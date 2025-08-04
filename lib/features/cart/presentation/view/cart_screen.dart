import 'package:flutter/material.dart';
import 'package:tech_store/features/cart/presentation/view/phone/cart_screen_phone.dart';
import 'package:tech_store/features/cart/presentation/view/tablet/cart_screen_tablet.dart';
import 'package:tech_store/shared/responsive/responsive_layout.dart';
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(phone: CartScreenPhone(),
        tablet: CartScreenTablet());
  }
}
