import 'package:tech_store/features/products-details/domain/entities/brand.dart';
import 'package:tech_store/features/products-details/domain/entities/category.dart';
import 'package:tech_store/features/products-details/domain/entities/version.dart';

class ProductDetailed{
  int id;
  String name;
  String poster_image;
  String description;
  String startting_price;
  Brand brand;
  Categories category;
  List<Version>? versions;
  double average_rating;
  ProductDetailed({required this.id, required this.name, required this.poster_image, required this.description, required this.startting_price, required this.brand, required this.category, required this.versions, required this.average_rating});

}