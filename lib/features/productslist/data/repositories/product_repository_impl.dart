import 'package:tech_store/features/productslist/data/datasources/products_list_api.dart';
import 'package:tech_store/features/productslist/domain/entities/category_count.dart';
import 'package:tech_store/features/productslist/domain/entities/price_range.dart';
import 'package:tech_store/features/productslist/data/models/price_count_model.dart';
import 'package:tech_store/features/productslist/domain/entities/product.dart';
import 'package:tech_store/features/productslist/domain/repositories/products_repository.dart';

class ProductRepositoryImpl implements ProductsRepository {
  final ProductService service;

  ProductRepositoryImpl(this.service);

  @override
  Future<List<Product>> fetchProducts({int page = 1}) async {
    final models = await service.fetchAllProducts(page);
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<PriceRange>> fetchProductCountPrice() async {
    final models = await service.fetchProductCountPrice();
    return models.map((model) => model.toEntity()).toList();
  }

  @override
  Future<List<CategoryCount>> fetchProductCategoryCount() async {
    final models =await service.fetchProductCategoryCount();
    return models.map((model) => model.toEntity()).toList();// Implement this as well if needed

  }
}
