import 'package:flutter/cupertino.dart';
import 'package:tech_store/features/productslist/presentation/views/phone/products_list_phone.dart';
import 'package:tech_store/features/productslist/presentation/views/tablet/product_list_tablet.dart';
import 'package:tech_store/shared/responsive/responsive_layout.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      phone: ProductsListScreen(),
      tablet: ProductListScreenTablet(),
    );
  }
}
