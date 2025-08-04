import 'package:tech_store/features/cart/domain/entities/cart_update.dart';
import 'package:tech_store/features/cart/domain/repository/cart_repository.dart';

class CartUpdateUseCase{
  final CartRepository cartRepository;
  CartUpdateUseCase(this.cartRepository);
  Future<void> call(CartUpdate cart,int id){
    return cartRepository.updateCart(cart, id);
  }
}