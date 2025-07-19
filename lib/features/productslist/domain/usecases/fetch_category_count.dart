import 'package:tech_store/features/productslist/domain/entities/category_count.dart';
import 'package:tech_store/features/productslist/domain/repositories/products_repository.dart';

class FetchCategoryCount{
  final ProductsRepository productsRepository;
  FetchCategoryCount(this.productsRepository);
  Future<List<CategoryCount>> call() async{
    return productsRepository.fetchProductCategoryCount();

  }
}