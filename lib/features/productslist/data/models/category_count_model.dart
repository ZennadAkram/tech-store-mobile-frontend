import 'package:tech_store/features/productslist/domain/entities/category_count.dart';

class CategoryCountModel{
int id;
String name;
int product_count;
CategoryCountModel({required this.id, required this.name, required this.product_count});

factory CategoryCountModel.fromJson(Map<String, dynamic> json){
  return CategoryCountModel(
    id: json['id'],
    name: json['name'],
    product_count: json['product_count'],
  );
}

CategoryCount toEntity() => CategoryCount(
  id: id,
  name: name,
  product_count: product_count,
);

}