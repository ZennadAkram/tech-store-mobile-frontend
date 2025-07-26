import 'package:tech_store/features/products-details/domain/entities/brand.dart';

class BrandModel{
  String name;
  BrandModel({required this.name});
  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      name: json['name'],
    );
  }
  Brand toEntity() {
    return Brand(
      name: name,
    );
  }

}