import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_store/features/productslist/domain/entities/brand.dart';
import 'package:tech_store/features/productslist/domain/entities/category_count.dart';
import 'package:tech_store/features/productslist/domain/entities/product.dart';
import 'package:tech_store/features/productslist/domain/entities/price_range.dart';
import 'package:tech_store/features/productslist/domain/usecases/fetch_all_products.dart';
import 'package:tech_store/features/productslist/domain/usecases/fetch_brands.dart';
import 'package:tech_store/features/productslist/domain/usecases/fetch_category_count.dart';
import 'package:tech_store/features/productslist/domain/usecases/fetch_price_count.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_store/features/productslist/domain/entities/product.dart';
import 'package:tech_store/features/productslist/domain/entities/price_range.dart';
import 'package:tech_store/features/productslist/domain/usecases/fetch_all_products.dart';
import 'package:tech_store/features/productslist/domain/usecases/fetch_price_count.dart';

class ProductsFetchViewmodel extends StateNotifier<AsyncValue<List<Product>>> {
  final FetchAllProducts _fetchAllProducts;
  final FetchPriceRangeCounts _fetchPriceRangeCounts;
  final FetchCategoryCount _fetchCategoryCount;
  final FetchBrandsUseCase _fetchBrands;

  ProductsFetchViewmodel(
      this._fetchAllProducts,
      this._fetchPriceRangeCounts,
      this._fetchCategoryCount,
      this._fetchBrands,
      ) : super(const AsyncLoading()) {
    fetchInitialProducts();
    fetchPriceRanges();
    fetchCategoryCounts();
    fetchBrands();
  }

  int _currentPage = 1;
  bool _isLoadingMore = false;
  bool _hasMore = true;

  List<PriceRange> _priceRanges = [];
  List<PriceRange> get priceRanges => _priceRanges;
  List<CategoryCount> _categoryCounts = [];
  List<CategoryCount> get categoryCounts => _categoryCounts;
  List<Brand> _brand =[];
  List<Brand> get brand => _brand;

  bool get isLoadingMore => _isLoadingMore;
  bool get hasMore => _hasMore;

  Future<List<Brand>> fetchBrands({int page = 1}) async {
    try {
      final brands = await _fetchBrands(page: page);
      _brand = brands;
      state = state.whenData((products) => products);
      return brands;
    } catch (e) {
      print("Failed to fetch brands: $e");
      return [];
    }
  }
  Future<void> fetchInitialProducts({Map<String, dynamic>? filters}) async {
    state = const AsyncLoading();
    _currentPage = 1;
    _hasMore = true;

    try {
      final products = await _fetchAllProducts(page: _currentPage, filters: filters);
      state = AsyncData(products);
      _hasMore = products.length >= 10;
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  String formatPriceRange(String range) {
    if (range.contains("-")) {
      final parts = range.split("-");
      return _formatSinglePrice(parts[0]) + " - " + _formatSinglePrice(parts[1]);
    } else if (range.contains("+")) {
      return _formatSinglePrice(range.replaceAll("+", "")) + "+";
    } else {
      return _formatSinglePrice(range);
    }
  }

  String _formatSinglePrice(String price) {
    // Remove any existing dollar signs or commas
    final cleaned = price.replaceAll(RegExp(r"[^\d]"), "");
    // Format with commas and add dollar sign
    return "\$${_addCommas(cleaned)}";
  }

  String _addCommas(String price) {
    if (price.isEmpty) return price;
    final number = int.tryParse(price) ?? 0;
    return number.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]},',
    );
  }
  Map<String, dynamic>? _currentFilters;
  Map<String, dynamic>? _currentSort;

  Future<void> fetchNextPage() async {
    if (_isLoadingMore || !_hasMore) return;

    _isLoadingMore = true;
    _currentPage += 1;

    try {
      final nextProducts = await _fetchAllProducts(page: _currentPage,sort: _currentSort,filters: _currentFilters);
      state = state.whenData((existing) {
        final updatedList = [...existing, ...nextProducts];
        _hasMore = nextProducts.length >= 10;
        return updatedList;
      });
    } catch (e, st) {
      state = AsyncError(e, st);
    } finally {
      _isLoadingMore = false;
    }
  }
  Future<void> applyFilters(Map<String, dynamic>? filters, Map<String, dynamic>? sort) async {
    state = const AsyncLoading();
    _currentPage = 1;
    _hasMore = true;

    _currentFilters = filters;
    _currentSort = sort;

    try {
      final filteredProducts = await _fetchAllProducts(
        page: _currentPage,
        filters: _currentFilters,
        sort: _currentSort,
      );

      state = AsyncData(filteredProducts);
      _hasMore = filteredProducts.length >= 10;
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }


  Future<void> fetchCategoryCounts() async {
    try {
      final newCounts = await _fetchCategoryCount();
      _categoryCounts = newCounts;
      // Force a state update to notify listeners
      state = state.whenData((products) => products);
      print("Price ranges fetched: ${_priceRanges.length} items");
    } catch (e) {
      print("Failed to fetch price range counts: $e");
    }
  }
  Future<void> fetchPriceRanges() async {
    try {
      final newRanges = await _fetchPriceRangeCounts();
      _priceRanges = newRanges;
      // Force a state update to notify listeners
      state = state.whenData((products) => products);
      print("Price ranges fetched: ${_priceRanges.length} items");
    } catch (e) {
      print("Failed to fetch price range counts: $e");
    }
  }

}
