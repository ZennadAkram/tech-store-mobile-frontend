
import 'package:tech_store/features/cart/data/models/version_detail_model.dart';
import 'package:tech_store/features/cart/domain/entities/items.dart';

class ItemsModel{
  int id;
  int quantity;
  VersionDetailModel? version_details;
  int? color_id;
  int? product_id;
  String? product_name;
  String? product_poster_image;
  int? stock;
  double? product_starting_price;
  String product_description;
  ItemsModel({required this.product_description,required this.id,required this.quantity,this.version_details,this.color_id,this.product_id,this.product_name,this.product_poster_image,this.stock,this.product_starting_price});
  factory ItemsModel.fromJson(Map<String, dynamic> json) {
    return ItemsModel(
      id: json['id'],
      quantity: json['quantity'],
      version_details: json['version_details'] != null
          ? VersionDetailModel.fromJson(json['version_details'])
          : null,
      color_id: json['color_id'],
      product_id: json['product_id'],
      product_name: json['product_name'],
      product_poster_image: json['product_poster_image'],
      stock: json['stock'],
      product_starting_price: json['product_starting_price'],
      product_description: json['product_description'],
    );






  }
  Item toEntity() {
    return Item(
      id: id,
      quantity: quantity,
      version_details: version_details?.toEntity(),
      color_id: color_id,
      product_id: product_id,
      product_name: product_name,
      product_poster_image: product_poster_image,
      stock: stock,
      product_starting_price: product_starting_price,
      product_description: product_description,
    );
  }
}