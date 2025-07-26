import 'package:tech_store/features/productslist/domain/entities/product.dart';
import 'package:tech_store/features/productslist/domain/repositories/products_repository.dart';



class FetchAllProducts {
  final ProductsRepository repository;

  FetchAllProducts(this.repository);

  Future<List<Product>> call({int page = 1, Map<String, dynamic>? filters,Map<String, dynamic>? sort}) {
    return repository.fetchProducts(page: page, filters: filters,sort: sort);
  }
}
