import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_store/features/cart/data/datasources/remote_api_impl.dart';
import 'package:tech_store/features/cart/data/repositories/cart_repository_impl.dart';
import 'package:tech_store/features/cart/domain/entities/cart.dart';
import 'package:tech_store/features/cart/domain/repository/cart_repository.dart';
import 'package:tech_store/features/cart/domain/usecases/cart_update_use_case.dart';
import 'package:tech_store/features/cart/domain/usecases/clear_cart_use_case.dart';
import 'package:tech_store/features/cart/domain/usecases/delete_item_use_case.dart';
import 'package:tech_store/features/cart/domain/usecases/get_cart_use_case.dart';
import 'package:tech_store/features/cart/presentation/viewmodels/cart_update_view_model.dart';
import 'package:tech_store/features/cart/presentation/viewmodels/cart_view_model.dart';
import 'package:tech_store/features/cart/presentation/viewmodels/quantity_viewmodel.dart';

final repositoryProvider=Provider<CartRepository>((ref){
  return CartRepositoryImpl(RemoteApiImpl());
});

final cartUseCaseProvider=Provider<FetchCartUseCase>((ref){
  return FetchCartUseCase(ref.watch(repositoryProvider));
});
final updateCartUseCaseProvider=Provider<CartUpdateUseCase>((ref){
  return CartUpdateUseCase(ref.watch(repositoryProvider));
});
final deleteCartUseCaseProvider=Provider<DeleteItemUseCase>((ref){
  return DeleteItemUseCase(ref.watch(repositoryProvider));
});
final clearCartUseCaseProvider=Provider<ClearCartUseCase>((ref){
  return ClearCartUseCase(ref.watch(repositoryProvider));
});
final cartViewModelProvider=StateNotifierProvider<CartViewModel,AsyncValue<Cart>>((ref)=>CartViewModel(
  ref.watch(clearCartUseCaseProvider),
  ref.watch(cartUseCaseProvider),
  ref.watch(deleteCartUseCaseProvider),
  ref,

));

final cartUpdateViewModelProvider=StateNotifierProvider<CartUpdateViewModel,AsyncValue<void>>((ref)=>CartUpdateViewModel(
  ref.watch(updateCartUseCaseProvider))
);
final quantityProvider = StateNotifierProvider<QuantityViewModel, Map<int, int>>(
      (ref) => QuantityViewModel(),
);

final toggleProvider=StateProvider<bool>((ref)=>false);
final toggleProvider2=StateProvider<bool>((ref)=>false);
final selectedCountryProvider = StateProvider<String?>((ref) => null);
final selectedStateProvider = StateProvider<String?>((ref) => null);
final subTotalProvider=StateProvider<double>((ref)=>0.0);
