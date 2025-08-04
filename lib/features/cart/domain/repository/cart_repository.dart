import 'package:tech_store/features/cart/domain/entities/cart.dart';
import 'package:tech_store/features/cart/domain/entities/cart_update.dart';

abstract class CartRepository{
  Future<Cart> getCart();
  Future<void> updateCart(CartUpdate cart,int id);
  Future<void> deleteItem(int id);
}