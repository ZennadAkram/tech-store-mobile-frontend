import 'package:tech_store/features/products-details/domain/entities/cart.dart';
import 'package:tech_store/features/products-details/domain/repositories/product_detail_repository.dart';

class CartUseCase{
  final ProductDetailRepository repository;
  CartUseCase(this.repository);
  Future<void> call(Cart cart){
    return repository.addToCart(cart);
  }

}