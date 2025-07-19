import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget phone;
  final Widget tablet;
  final Widget? desktop;

  const ResponsiveLayout({
    required this.phone,
    required this.tablet,
    this.desktop,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    if (width < 600) {
      return phone;
    } else if (width < 1024) {
      return tablet;
    } else {
      return desktop ?? tablet;
    }
  }
}
