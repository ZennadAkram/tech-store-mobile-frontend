import 'package:tech_store/features/productslist/data/models/review_model.dart';
import 'package:tech_store/features/productslist/data/models/version_model.dart';
import 'package:tech_store/features/productslist/domain/entities/product.dart';

class ProductModel {
  final int? id;
  final String? name;
  final String? description;
  final double? startingPrice;
  final String? posterImage;
  final String? brandName;
  final String? categoryName;
  final double? averageRating;
  final int? reviewCount;
  final List<VersionModel>? versions;
  final List<ReviewModel>? reviews;

  ProductModel({
    this.id,
    this.name,
    this.description,
    this.startingPrice,
    this.posterImage,
    this.brandName,
    this.categoryName,
    this.averageRating,
    this.reviewCount,
    this.versions,
    this.reviews,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      startingPrice: json['starting_price'] != null
          ? double.tryParse(json['starting_price'].toString())
          : null,
      posterImage: json['poster_image'] as String?,
      brandName: json['brand']?['name'],
      categoryName: json['category']?['name'],
      averageRating: (json['average_rating'] as num?)?.toDouble(),
      reviewCount: json['review_count'],
      versions: (json['versions'] as List?)?.map((v) => VersionModel.fromJson(v)).toList(),
      reviews: (json['reviews'] as List?)?.map((x) => ReviewModel.fromJson(x)).toList(),
    );
  }

  Product toEntity() => Product(
    id: id ?? 0,
    name: name ?? '',
    description: description ?? '',
    startingPrice: startingPrice ?? 0.0,
    imageUrl: posterImage,
    brand: brandName ?? '',
    category: categoryName ?? '',
    averageRating: averageRating,
    reviewCount: reviewCount ?? 0,
    versions: versions?.map((v) => v.toEntity()).toList() ?? [],
    reviews: reviews?.map((r) => r.toEntity()).toList() ?? [],
  );
}
