import 'package:flutter/material.dart';
import 'package:tech_store/Core/constants/app_colors.dart';
class TabBarsContainer extends StatelessWidget {
  const TabBarsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      elevation: 0,
      child: TabBar(
        labelColor: Colors.black,
        unselectedLabelColor: AppColors.IconsBg,
        labelStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.bold,
        ),
        indicatorColor: AppColors.blueComponents,
        dividerColor: Colors.transparent,
        indicator: const UnderlineTabIndicator(
          borderSide: BorderSide(
              width: 2.0, color: AppColors.blueComponents),
          insets: EdgeInsets.symmetric(horizontal: -5.0),
        ),
        tabs: const [
          Tab(text: 'About Product'),
          Tab(text: 'Details'),
          Tab(text: 'Specs'),
        ],
      ),
    );
  }
}
