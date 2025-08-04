import 'package:tech_store/features/cart/domain/entities/images.dart';

class ImageModel{
  int id;
  String image;
  ImageModel({required this.id,required this.image});
  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      id: json['id'],
      image: json['image'],
    );
  }
  Image toEntity() {
    return Image(
      id: id,
      image: image,
    );

  }

}