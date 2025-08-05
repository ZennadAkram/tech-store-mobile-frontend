import 'package:tech_store/features/cart/domain/repository/cart_repository.dart';

class ClearCartUseCase{
  final CartRepository repository;
  ClearCartUseCase(this.repository);
  Future<void> call() {
   return repository.clearCart();
  }

}