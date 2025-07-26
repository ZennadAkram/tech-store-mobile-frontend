import 'package:tech_store/features/products-details/domain/entities/colors.dart';
import 'package:tech_store/features/products-details/domain/entities/features.dart';
import 'package:tech_store/features/products-details/domain/entities/images.dart';

class Version{
  int id;
  int stock;
  String storage_capacity;
  List<Images>? images;
  List<Colors>? colors;
  String price;
  List<Features>? features;
  Version({required this.id,required this.price,required this.stock, required this.storage_capacity, required this.images, required this.colors, required this.features});

}