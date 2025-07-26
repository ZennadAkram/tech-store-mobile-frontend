import 'package:tech_store/features/productslist/domain/entities/brand.dart';

class BrandModel{
  String name;
  String image;
  BrandModel(this.name, this.image);

  factory BrandModel.fromJson(Map<String, dynamic> json) {

    return BrandModel(
      json['name'],
      json['image'],
    );
  }
Brand toEntity() {
    return Brand(name, image);
}

}