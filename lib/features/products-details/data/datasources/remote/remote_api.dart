import 'package:tech_store/features/products-details/data/models/product_detail_model.dart';

abstract class ProductsDetailRemoteData{
  Future<ProductDetailModel> getProductDetail(int id);
}