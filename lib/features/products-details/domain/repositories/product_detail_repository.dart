import 'package:tech_store/features/products-details/domain/entities/cart.dart';
import 'package:tech_store/features/products-details/domain/entities/product_detailed.dart';

abstract class ProductDetailRepository{
  Future<ProductDetailed> getProductDetails(int id);
  Future<void> addToCart(Cart cart);

}