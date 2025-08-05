import 'package:tech_store/features/cart/data/datasources/remote_api.dart';
import 'package:tech_store/features/cart/data/models/cart_update_model.dart';
import 'package:tech_store/features/cart/domain/entities/cart.dart';
import 'package:tech_store/features/cart/domain/entities/cart_update.dart';
import 'package:tech_store/features/cart/domain/repository/cart_repository.dart';

class CartRepositoryImpl implements CartRepository{
  final RemoteApi api;
  CartRepositoryImpl(this.api);
  @override
  Future<Cart> getCart() async {
 final model = await api.getCart();
 return model.toEntity();
  }

  @override
  Future<void> updateCart(CartUpdate cart, int id) async {
    final model = CartUpdateModel.fromEntity(cart);
    return await api.updateCart(model, id);
  }

  @override
  Future<void> deleteItem(int id) async{
    return await api.deleteCart(id);
  }

  @override
  Future<void> clearCart() async{
    await api.clearCart();
  }

  }

