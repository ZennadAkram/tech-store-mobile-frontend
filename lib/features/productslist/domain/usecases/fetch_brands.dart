import 'package:tech_store/features/productslist/domain/entities/brand.dart';
import 'package:tech_store/features/productslist/domain/repositories/products_repository.dart';

class FetchBrandsUseCase{
  final ProductsRepository repository;
  FetchBrandsUseCase(this.repository);

  Future<List<Brand>> call({int page = 1}) {
    return repository.fetchBrands(page: page);

  }
}