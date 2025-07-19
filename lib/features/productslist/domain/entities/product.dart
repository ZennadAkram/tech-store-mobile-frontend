import 'version.dart';
import 'review.dart';

class Product {
  final int? id;
  final String? name;
  final String? description;
  final double? startingPrice;
  final String? imageUrl;
  final String? brand;
  final String? category;
  final double? averageRating;
  final int? reviewCount;
  final List<Version>? versions;
  final List<Review>? reviews;

  Product({
    this.id,
    this.name,
    this.description,
    this.startingPrice,
    this.imageUrl,
    this.brand,
    this.category,
    this.averageRating,
    this.reviewCount,
    this.versions,
    this.reviews,
  });
}
