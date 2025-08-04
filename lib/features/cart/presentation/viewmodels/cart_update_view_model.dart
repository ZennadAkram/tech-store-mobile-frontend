import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_store/features/cart/domain/entities/cart_update.dart';
import 'package:tech_store/features/cart/domain/usecases/cart_update_use_case.dart';

class CartUpdateViewModel extends StateNotifier<AsyncValue<void>>{
  CartUpdateUseCase cartUpdateUseCase;
  CartUpdateViewModel(this.cartUpdateUseCase):super(const AsyncData(null));
  Future<void>updateCart(CartUpdate cart,int id)async{
    state=const AsyncLoading();
    try{

      await cartUpdateUseCase(cart,id);
      state = const AsyncData(null);
    }catch(e,st){
      state = AsyncError(e, st);
    }

  }
}