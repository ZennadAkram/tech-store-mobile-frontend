
import 'package:tech_store/features/productslist/domain/entities/price_range.dart';
import 'package:tech_store/features/productslist/domain/repositories/products_repository.dart';

class FetchPriceRangeCounts{
  final ProductsRepository productsRepository;
  FetchPriceRangeCounts(this.productsRepository);
  Future<List<PriceRange>> call() async{
    return productsRepository.fetchProductCountPrice();
  }
}