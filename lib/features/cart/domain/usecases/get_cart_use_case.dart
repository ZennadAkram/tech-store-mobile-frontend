import 'package:tech_store/features/cart/domain/entities/cart.dart';
import 'package:tech_store/features/cart/domain/repository/cart_repository.dart';

class FetchCartUseCase{
  final CartRepository cartRepository;
  FetchCartUseCase(this.cartRepository);
  Future<Cart> call() {
    return cartRepository.getCart();

  }

}