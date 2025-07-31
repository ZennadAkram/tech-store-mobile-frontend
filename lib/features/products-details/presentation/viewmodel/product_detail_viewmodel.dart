import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_store/features/products-details/domain/entities/product_detailed.dart';
import 'package:tech_store/features/products-details/domain/usecases/fetch_product_detaile_usecase.dart';

class ProductDetailViewModel extends StateNotifier<AsyncValue<ProductDetailed>> {
  final FetchProductDetail _fetchProductDetail;


  ProductDetailViewModel(this._fetchProductDetail) : super(const AsyncLoading()) {
   fetchProductDetail(21);
  }
  late ProductDetailed product;
  Future<void> fetchProductDetail(int id) async {
    state = const AsyncLoading();
    try {
      final product = await _fetchProductDetail(id);
      this.product = product;
      state = AsyncData(product);
    } catch (e, st) {
      state = AsyncError(e, st);
    }

    }

    
}