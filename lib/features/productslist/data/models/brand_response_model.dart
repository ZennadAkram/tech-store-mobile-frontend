import 'package:tech_store/features/productslist/data/models/brand_model.dart';

class BrandResponseModel{
  final int count;
  final String? next;
  final String? previous;
  final List<BrandModel> results;
  BrandResponseModel({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });
  factory BrandResponseModel.fromJson(Map<String, dynamic> json) {
    return BrandResponseModel(
      count: json['count'],
      next: json['next'],
      previous: json['previous'],
      results: List<BrandModel>.from(
        json['results'].map((x) => BrandModel.fromJson(x)),
      ));
    }
}