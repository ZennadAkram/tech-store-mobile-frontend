import 'package:flutter/material.dart';
import 'package:tech_store/features/productslist/domain/entities/product.dart';
import 'package:tech_store/features/productslist/presentation/widgets/product_card_list.dart';
class ProductListView extends StatelessWidget {
  final List<Product> products;
  const ProductListView({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount:products.length ,
      itemBuilder: (BuildContext context, int index) {
      return Column(
        children: [
          ProductCardList(
            product: products[index],
          ),
          SizedBox(height: 40,),
        ],
      );
    },);
  }
}
