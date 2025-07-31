import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_store/features/products-details/domain/entities/cart.dart';
import 'package:tech_store/features/products-details/domain/usecases/cart_use_case.dart';

class CartViewModel extends StateNotifier<AsyncValue<void>>{
  final CartUseCase cartUseCase;
  CartViewModel(this.cartUseCase) : super(const AsyncData(null));

  Future<void> addToCart(Cart cart) async {
    state = const AsyncLoading();
    try {
      await cartUseCase(cart);
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }

  }

}