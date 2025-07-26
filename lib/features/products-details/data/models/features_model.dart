import 'package:tech_store/features/products-details/domain/entities/features.dart';

class FeaturesModel{
  int id;
  String title;
  String description;
  String value;
  String image;
  FeaturesModel({required this.id, required this.title, required this.description, required this.value, required this.image});
  factory FeaturesModel.fromJson(Map<String, dynamic> json) {
    return FeaturesModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      value: json['value'],
      image: json['image'],);
  }
  Features toEntity() {
    return Features(
      id: id,
      title: title,
      description: description,
      value: value,
      imageUrl: image,
    );
  }
}