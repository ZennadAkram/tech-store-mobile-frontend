import 'package:tech_store/features/productslist/domain/entities/price_range.dart';

class PriceCountModel{
int count;
String range;
PriceCountModel({required this.count,required this.range});

factory PriceCountModel.fromJson(Map<String, dynamic> json) {
  return PriceCountModel(
    count: json['count'],
    range: json['range'],
  );

}
PriceRange toEntity() => PriceRange(

  count: count,
  range: range,

);
}