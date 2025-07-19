import 'package:tech_store/features/productslist/domain/entities/category_count.dart';
import 'package:tech_store/features/productslist/domain/entities/price_range.dart';
import 'package:tech_store/features/productslist/domain/entities/product.dart';

abstract class ProductsRepository {
  Future<List<Product>> fetchProducts({int page = 1});
  Future<List<PriceRange>> fetchProductCountPrice();
  Future<List<CategoryCount>> fetchProductCategoryCount();
}
