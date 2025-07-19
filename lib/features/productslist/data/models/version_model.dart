import 'color_model.dart';
import 'package:tech_store/features/productslist/domain/entities/version.dart';

class VersionModel {
  final int? id;
  final List<ColorModel>? colors;

  VersionModel({this.id, this.colors});

  factory VersionModel.fromJson(Map<String, dynamic> json) => VersionModel(
    id: json['id'],
    colors: (json['colors'] as List?)?.map((x) => ColorModel.fromJson(x)).toList(),
  );

  Version toEntity() => Version(
    id: id ?? 0,
    colors: colors?.map((e) => e.toEntity()).toList() ?? [],
  );
}
