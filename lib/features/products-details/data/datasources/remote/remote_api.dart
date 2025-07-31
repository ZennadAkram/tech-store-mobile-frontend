import 'package:tech_store/features/products-details/data/models/cart_model.dart';
import 'package:tech_store/features/products-details/data/models/product_detail_model.dart';

abstract class ProductsDetailRemoteData{
  Future<ProductDetailModel> getProductDetail(int id);
  Future<void> addToCart(CartModel cart);
}