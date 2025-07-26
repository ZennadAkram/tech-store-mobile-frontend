import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/material.dart';
import 'package:tech_store/Core/constants/app_colors.dart';

class BrandCard extends StatelessWidget {
  final String brand;
  final String imageUrl;

  const BrandCard({
    super.key,
    required this.brand,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          width: 0.1,
          color: AppColors.labelColor,
        ),
      ),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: 100,
        height: 80,
        fit: BoxFit.contain,
      ),
    );
  }
}
