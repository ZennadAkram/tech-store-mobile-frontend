import 'package:tech_store/features/cart/domain/entities/images.dart';

class VersionDetail{
  int id;
  String price;
  String storage_capacity;
  int stock;
  List<Image>? images;
  VersionDetail({required this.id,required this.price,required this.storage_capacity,required this.stock,this.images});
}