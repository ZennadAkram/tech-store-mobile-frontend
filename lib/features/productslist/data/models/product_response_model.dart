import 'package:tech_store/features/productslist/data/models/product_model.dart';

class ProductResponseModel {
  final int count;
  final String? next;
  final String? previous;
  final List<ProductModel> results;

  ProductResponseModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });

  factory ProductResponseModel.fromJson(Map<String, dynamic> json) {
    return ProductResponseModel(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: List<ProductModel>.from(
        json['results'].map((x) => ProductModel.fromJson(x)),
      ),
    );
  }
}
