import 'package:tech_store/features/cart/domain/entities/items.dart';

class Cart{
  int id;
  List<Item> items;
  Cart({required this.id,required this.items});

}