import 'package:tech_store/features/products-details/domain/entities/product_detailed.dart';
import 'package:tech_store/features/products-details/domain/repositories/product_detail_repository.dart';

class FetchProductDetail{
 final ProductDetailRepository repository;
  FetchProductDetail(this.repository);
  Future<ProductDetailed> call(int id){
    return repository.getProductDetails(id);
  }
}