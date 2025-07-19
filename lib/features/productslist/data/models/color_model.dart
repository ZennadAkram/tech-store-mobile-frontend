import 'package:tech_store/features/productslist/domain/entities/color.dart';

class ColorModel {
  final int? id;
  final String? name;
  final String? hex;

  ColorModel({this.id, this.name, this.hex});

  factory ColorModel.fromJson(Map<String, dynamic> json) => ColorModel(
    id: json['id'],
    name: json['name'],
    hex: json['hex'],
  );

  Color toEntity() => Color(
    id: id ?? 0,
    name: name ?? '',
    code: hex ?? '',
  );
}
