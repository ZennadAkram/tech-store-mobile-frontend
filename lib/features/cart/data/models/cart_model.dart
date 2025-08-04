
import 'package:tech_store/features/cart/data/models/items_model.dart';
import 'package:tech_store/features/cart/domain/entities/cart.dart';

class CartModel {
  int id;
  List<ItemsModel> items;

  CartModel({required this.id, required this.items});

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'],
      items: (json['items'] as List<dynamic>).map((itemJson) =>
          ItemsModel.fromJson(itemJson)).toList() ,
    );
  }
  Cart toEntity() {
    return Cart(
      id: id,
      items: items.map((item) => item.toEntity()).toList(),
    );

  }
}