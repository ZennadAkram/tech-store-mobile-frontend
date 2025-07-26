import 'package:tech_store/features/products-details/domain/entities/colors.dart';

class ColorModel{
  int id;
  String code;
  String name;
  ColorModel({required this.id, required this.code, required this.name});
  factory ColorModel.fromJson(Map<String, dynamic> json) {
    return ColorModel(
      id: json['id'],
      code: json['code'],
      name: json['name'],

    );
  }
  Colors toEntity() {
    return Colors(
      id: id,
      code: code,
      name: name,
    );

  }
}