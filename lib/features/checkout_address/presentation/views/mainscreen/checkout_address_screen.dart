import 'package:flutter/material.dart';
import 'package:tech_store/features/checkout_address/presentation/views/phone/checkout_address_screen_phone.dart';
import 'package:tech_store/features/checkout_address/presentation/views/tablet/checkout_address_screen_tablet.dart';
import 'package:tech_store/shared/responsive/responsive_layout.dart';
class CheckoutAddressScreen extends StatelessWidget {
  const CheckoutAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveLayout(phone: CheckoutAddressScreenPhone(), tablet: CheckoutAddressScreenTablet());
  }
}
