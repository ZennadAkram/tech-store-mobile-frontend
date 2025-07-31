import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_store/features/products-details/data/datasources/remote/remote_api_impl.dart';
import 'package:tech_store/features/products-details/data/repositories/product_detail_repository_impl.dart';
import 'package:tech_store/features/products-details/domain/entities/product_detailed.dart';
import 'package:tech_store/features/products-details/domain/repositories/product_detail_repository.dart';
import 'package:tech_store/features/products-details/domain/usecases/cart_use_case.dart';
import 'package:tech_store/features/products-details/domain/usecases/fetch_product_detaile_usecase.dart';
import 'package:tech_store/features/products-details/presentation/viewmodel/cart_view_model.dart';
import 'package:tech_store/features/products-details/presentation/viewmodel/product_detail_viewmodel.dart';
import 'package:tech_store/features/products-details/presentation/viewmodel/quantity_notifier.dart';
import 'package:tech_store/shared/viewmodels/appbar_viewmodel.dart';

final productDetailDepositoryProvider =Provider<ProductDetailRepository>((ref){
  return ProductDetailRepositoryImpl(ProductsDetailRemoteDataImpl());
});
final productDetailUseCaseProvider=Provider<FetchProductDetail>((ref){

  return FetchProductDetail(ref.watch(productDetailDepositoryProvider));
});
final cartUseCaseProvider=Provider<CartUseCase>((ref){
  return CartUseCase(ref.watch(productDetailDepositoryProvider));
});

final cartViewModelProvider=StateNotifierProvider<CartViewModel,AsyncValue<void>>((ref)=>CartViewModel(

  ref.watch(cartUseCaseProvider))
);

final productDetailViewModelProvider=StateNotifierProvider<ProductDetailViewModel,AsyncValue<ProductDetailed>>((ref)=>ProductDetailViewModel(
  ref.watch(productDetailUseCaseProvider)
)
);



final likedColorProvider=StateProvider<bool>((ref)=>false);
final currentImageProvider=StateProvider<int>((ref)=>0);
final currentColorProvider=StateProvider<int>((ref)=>0);
final currentVersionProvider=StateProvider<int>((ref)=>0);
final quantityProvider = StateNotifierProvider<QuantityNotifier, int>((ref) {
  return QuantityNotifier();
});
