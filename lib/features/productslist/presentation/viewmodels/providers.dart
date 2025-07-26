import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_store/features/productslist/data/datasources/products_list_api.dart';
import 'package:tech_store/features/productslist/data/repositories/product_repository_impl.dart';
import 'package:tech_store/features/productslist/domain/entities/brand.dart';
import 'package:tech_store/features/productslist/domain/entities/category_count.dart';
import 'package:tech_store/features/productslist/domain/entities/price_range.dart';
import 'package:tech_store/features/productslist/domain/entities/product.dart';
import 'package:tech_store/features/productslist/domain/usecases/fetch_all_products.dart';
import 'package:tech_store/features/productslist/domain/repositories/products_repository.dart';
import 'package:tech_store/features/productslist/domain/usecases/fetch_brands.dart';
import 'package:tech_store/features/productslist/domain/usecases/fetch_category_count.dart';
import 'package:tech_store/features/productslist/domain/usecases/fetch_price_count.dart';
import 'package:tech_store/features/productslist/presentation/viewmodels/products_fetch_viewmodel.dart';

// Repository
final productsRepositoryProvider = Provider<ProductsRepository>((ref) {
  return ProductRepositoryImpl(ProductService());
});

// Use Cases
final fetchAllProductsProvider = Provider<FetchAllProducts>((ref) {
  final repo = ref.watch(productsRepositoryProvider);
  return FetchAllProducts(repo);
});
final fetchBrandsProvider = Provider<FetchBrandsUseCase>((ref) {
  final repo = ref.watch(productsRepositoryProvider);
  return FetchBrandsUseCase(repo);
});

final brandsProvider = Provider<List<Brand>>((ref) {
  ref.watch(productViewModelProvider); // This makes it rebuild when viewmodel changes
  final viewModel = ref.read(productViewModelProvider.notifier);
  return viewModel.brand;
});
final fetchPriceRangeCountsProvider = Provider<FetchPriceRangeCounts>((ref) {
  final repo = ref.watch(productsRepositoryProvider);
  return FetchPriceRangeCounts(repo);
});
final fetchCategoryCountProvider = Provider<FetchCategoryCount>((ref) {
  final repo = ref.watch(productsRepositoryProvider);
  return FetchCategoryCount(repo);
});

// Main ViewModel
final productViewModelProvider = StateNotifierProvider<ProductsFetchViewmodel, AsyncValue<List<Product>>>(
      (ref) => ProductsFetchViewmodel(
    ref.watch(fetchAllProductsProvider),
    ref.watch(fetchPriceRangeCountsProvider),
        ref.watch(fetchCategoryCountProvider),
        ref.watch(fetchBrandsProvider),

  ),
);

// Filter Providers
final productFilterProvider = StateProvider<String>((ref) => 'All');
final togglcategory = StateProvider<bool>((ref) => false);
final toggleprice = StateProvider<bool>((ref) => false);
final togglecolor = StateProvider<bool>((ref) => false);
final togglebrand = StateProvider<bool>((ref) => false);

// Price Ranges Provider
final priceRangesProvider = Provider<List<PriceRange>>((ref) {
  // This will rebuild when productViewModelProvider's state changes
  ref.watch(productViewModelProvider);
  final viewModel = ref.read(productViewModelProvider.notifier);
  return viewModel.priceRanges;
});
final categoryCountsProvider = Provider<List<CategoryCount>>((ref) {
  // This will rebuild when productViewModelProvider's state changes
  ref.watch(productViewModelProvider);
  final viewModel = ref.read(productViewModelProvider.notifier);
  return viewModel.categoryCounts;
});
final priceFormatterProvider = Provider<String Function(String)>((ref) {
  return ref.read(productViewModelProvider.notifier).formatPriceRange;
});
final categoryFilterProvider=StateProvider<String>((ref)=>'');
final priceFiltersProvider=StateProvider<String>((ref)=>'');
final brandFilterProvider=StateProvider<String>((ref)=>'');
final filtersNumberProvider=StateProvider<int>((ref)=>0);
final listOrGridProvider=StateProvider<bool>((ref)=>false);