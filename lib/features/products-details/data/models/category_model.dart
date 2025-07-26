import 'package:tech_store/features/products-details/domain/entities/category.dart';

class CategoryModel{
  String name;
  CategoryModel({required this.name});
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      name: json['name'],
    );
  }
  Categories toEntity() {
    return Categories(
      name: name,
    );
  }

}