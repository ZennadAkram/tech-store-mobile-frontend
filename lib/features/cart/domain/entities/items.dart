import 'package:tech_store/features/cart/domain/entities/version_detail.dart';

class Item{
  int id;
  int quantity;
  VersionDetail? version_details;
  int? color_id;
  int? product_id;
  String? product_name;
  String? product_poster_image;
  int? stock;
  double? product_starting_price;
  String product_description;
  Item({required this.product_description,required this.id,required this.quantity,this.version_details,this.color_id,this.product_id,this.product_name,this.product_poster_image,this.stock,this.product_starting_price});

}