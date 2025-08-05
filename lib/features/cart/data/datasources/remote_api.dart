
import 'package:tech_store/features/cart/data/models/cart_model.dart';
import 'package:tech_store/features/cart/data/models/cart_update_model.dart';

abstract class RemoteApi{
  Future<CartModel> getCart();
  Future<void> updateCart(CartUpdateModel cart,int id);
  Future<void> deleteCart(int id);
  Future<void> clearCart();

}