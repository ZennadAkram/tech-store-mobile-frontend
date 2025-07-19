import 'package:tech_store/features/productslist/domain/entities/review.dart';

class ReviewModel {
  final int? id;
  final int? user;
  final int? rating;
  final String? review;
  final DateTime? createdAt;

  ReviewModel({
    this.id,
    this.user,
    this.rating,
    this.review,
    this.createdAt,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) => ReviewModel(
    id: json['id'],
    user: json['user'],
    rating: json['rating'],
    review: json['review'],
    createdAt: json['created_at'] != null
        ? DateTime.tryParse(json['created_at'])
        : null,
  );

  Review toEntity() => Review(
    id: id ?? 0,
    user: user ?? 0,
    rating: rating ?? 0,
    review: review ?? '',
    createdAt: createdAt ?? DateTime.now(),
  );
}
