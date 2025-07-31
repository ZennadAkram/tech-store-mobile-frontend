import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:tech_store/Core/constants/app_colors.dart';
import 'package:tech_store/features/auth/presentation/widgets/drawer.dart';
import 'package:tech_store/features/products-details/presentation/viewmodel/product_detail_providers.dart';
import 'package:tech_store/features/products-details/presentation/widgets/tablets/desc_tablet.dart';
import 'package:tech_store/features/products-details/presentation/widgets/tablets/features_and_images.dart';
import 'package:tech_store/features/products-details/presentation/widgets/tablets/picture_and_like.dart';
import 'package:tech_store/features/products-details/presentation/widgets/tablets/tab_bar_and_add_to_cart_container.dart';
import 'package:tech_store/shared/widgets/app_bar.dart';
class ProductDetailScreenTablet extends ConsumerWidget {
  const ProductDetailScreenTablet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentVersion = ref.watch(currentVersionProvider);
    final liked=ref.watch(likedColorProvider);
    final currentImage = ref.watch(currentImageProvider);
    final screenWidth = MediaQuery.of(context).size.width;
    final products = ref.watch(productDetailViewModelProvider);
    return products.when(
      error: (error, stackTrace) => Center(child: Text(error.toString())),
      loading: () => Center(child: CircularProgressIndicator()),
      data: (product) {
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            drawer: DrawerCostume(),
            appBar: AppBarCostume(),
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Column(
                  children: [
                  TabBarAndAddToCartContainer(product: product),
                   Row(
                     children: [
                       DescTablet(product: product),
                       PictureAndLike(product: product)
                     ],
                   ),
                    FeaturesAndImages(features: product.versions?[currentVersion].features ?? []),
                        ],
                      ),
            ),

        )

        );
      }
    );
  }
}
