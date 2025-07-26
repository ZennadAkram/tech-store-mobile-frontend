import 'package:tech_store/features/products-details/data/models/brand_model.dart';
import 'package:tech_store/features/products-details/data/models/category_model.dart';
import 'package:tech_store/features/products-details/data/models/version_model.dart';
import 'package:tech_store/features/products-details/domain/entities/product_detailed.dart';

class ProductDetailModel{
  int id;
  String name;
  String poster_image;
  String description;
  String startting_price;
  BrandModel? brand;
  CategoryModel? category;
  List<VersionModel>? versions;
  double? average_rating;
  ProductDetailModel({required this.average_rating,required this.id, required this.name, required this.poster_image, required this.description, required this.startting_price, required this.brand, required this.category, required this.versions});
  factory ProductDetailModel.fromJson(Map<String, dynamic> json) {
    return ProductDetailModel(
      id: json['id'],
      name: json['name'],
      poster_image: json['poster_image'],
      description: json['description'],
      startting_price: json['starting_price'],
      brand: json['brand'] != null ? BrandModel.fromJson(json['brand']) : null,
      category: json['category'] != null ? CategoryModel.fromJson(json['category']) : null,
      versions: json['versions'] != null ? (json['versions'] as List).map((i) => VersionModel.fromJson(i)).toList() : [],
      average_rating: json['average_rating'],


    );
  }
  ProductDetailed toEntity() {
    return ProductDetailed(
      id: id,
      name: name,
      poster_image: poster_image,
      description: description,
      startting_price: startting_price,
      brand: brand!.toEntity(),
      category: category!.toEntity(),
      versions: versions != null ? versions!.map((i) => i.toEntity()).toList() : [],
      average_rating:average_rating ?? 0,
    );

  }

}