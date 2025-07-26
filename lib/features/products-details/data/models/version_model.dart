import 'package:tech_store/features/products-details/data/models/colors_model.dart';
import 'package:tech_store/features/products-details/data/models/features_model.dart';
import 'package:tech_store/features/products-details/data/models/image_model.dart';
import 'package:tech_store/features/products-details/domain/entities/version.dart';

class VersionModel{
  int id;
  int stock;
  String storage_capacity;
  List<ImageModel>? images;
  List<ColorModel>? colors;
  String price;
  List<FeaturesModel>? features;
  VersionModel({required this.id,required this.price,required this.stock, required this.storage_capacity, required this.images, required this.colors, required this.features});
  factory VersionModel.fromJson(Map<String, dynamic> json) {
    return VersionModel(
      id: json['id'],
      price: json['price'],
      stock: json['stock'],
      storage_capacity: json['storage_capacity'],
      images: json['images'] != null ? (json['images'] as List).map((i) => ImageModel.fromJson(i)).toList() : [],
      colors: json['colors'] != null ? (json['colors'] as List).map((i) => ColorModel.fromJson(i)).toList() : [],
      features: json['features'] != null ? (json['features'] as List).map((i) => FeaturesModel.fromJson(i)).toList() :[],


    );


  }
  Version toEntity() {
   return Version(
      id: id,
      price: price,
      stock: stock,
      storage_capacity: storage_capacity,
      images: images != null ? images!.map((i) => i.toEntity()).toList() : [],
      colors: colors != null ? colors!.map((i) => i.toEntity()).toList() : [],
      features: features != null ? features!.map((i) => i.toEntity()).toList() : [],
   );
  }
}