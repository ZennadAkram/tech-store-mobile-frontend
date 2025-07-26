import 'package:tech_store/features/productslist/domain/entities/brand.dart';
import 'package:tech_store/features/productslist/domain/entities/category_count.dart';
import 'package:tech_store/features/productslist/domain/entities/price_range.dart';
import 'package:tech_store/features/productslist/domain/entities/product.dart';

abstract class ProductsRepository {
  Future<List<Product>> fetchProducts({int? page = 1, Map<String, dynamic>? filters,Map<String, dynamic>? sort});
  Future<List<PriceRange>> fetchProductCountPrice();
  Future<List<CategoryCount>> fetchProductCategoryCount();
  Future<List<Brand>> fetchBrands({int? page = 1});
}
