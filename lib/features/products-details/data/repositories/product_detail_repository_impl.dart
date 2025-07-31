import 'package:tech_store/features/products-details/data/datasources/remote/remote_api.dart';
import 'package:tech_store/features/products-details/data/models/cart_model.dart';
import 'package:tech_store/features/products-details/domain/entities/cart.dart';
import 'package:tech_store/features/products-details/domain/entities/product_detailed.dart';
import 'package:tech_store/features/products-details/domain/repositories/product_detail_repository.dart';

class ProductDetailRepositoryImpl implements ProductDetailRepository {
  final ProductsDetailRemoteData remoteDataSource;

  ProductDetailRepositoryImpl(this.remoteDataSource);

  @override
  Future<ProductDetailed> getProductDetails(int id) async {
    final model = await remoteDataSource.getProductDetail(id);
    return model.toEntity(); //
  }

  @override
  Future<void> addToCart(Cart cart) {
    final model = CartModel.fromEntity(cart);
    return remoteDataSource.addToCart(model);
  }
}
