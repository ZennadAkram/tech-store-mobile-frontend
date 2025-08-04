
import 'package:tech_store/features/cart/data/models/image_model.dart';
import 'package:tech_store/features/cart/domain/entities/version_detail.dart';

class VersionDetailModel{
  int id;
  String price;
  String storage_capacity;
  int stock;
  List<ImageModel>? images;
  VersionDetailModel({required this.id,required this.price,required this.storage_capacity,required this.stock,this.images});
  factory VersionDetailModel.fromJson(Map<String, dynamic> json) {
    return VersionDetailModel(
      id: json['id'],
      price: json['price'],
      storage_capacity: json['storage_capacity'],
      stock: json['stock'],
      images: (json['images'] as List<dynamic>?)
          ?.map((imageJson) => ImageModel.fromJson(imageJson))
          .toList(),
    );




  }
  VersionDetail toEntity() {
    return VersionDetail(
      id: id,
      price: price,
      storage_capacity: storage_capacity,
      stock: stock,
      images: images?.map((image) => image.toEntity()).toList(),
    );

  }
}