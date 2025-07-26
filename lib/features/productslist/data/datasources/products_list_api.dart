import 'package:dio/dio.dart';
import 'package:tech_store/core/network/public_dio.dart';
import 'package:tech_store/features/productslist/data/models/brand_model.dart';
import 'package:tech_store/features/productslist/data/models/category_count_model.dart';
import 'package:tech_store/features/productslist/data/models/price_count_model.dart';
import 'package:tech_store/features/productslist/data/models/product_model.dart';

class ProductService {
  final Dio _dio = PublicDio.dio;

Future<List<BrandModel>> fetchBrands({int? page}) async {
  try{
    final response = await _dio.get('/ListBrand/');
    final List data = response.data['results'];
    return data.map((json) => BrandModel.fromJson(json)).toList();
  }catch(e){
    print("🔴 General error: $e");
    throw Exception("Unknown error occurred");
  }
}

  Future<List<ProductModel>> fetchAllProducts(int? page, {Map<String, dynamic>? filters,Map<String, dynamic>? sort}) async {
    try {
      final response = await _dio.get(
        '/products/',
        queryParameters: {
          'page': page,
          if (filters != null) ...filters,
          if (sort != null) ...sort, // Spread the filters into the query
        },
      );


      final List data = response.data['results'] ?? response.data;

      return data.map((json) => ProductModel.fromJson(json)).toList();
    } on DioException catch (e) {
      print("🔴 Dio error: ${e.response?.data ?? e.message}");
      throw Exception("Failed to fetch products");
    } catch (e) {
      print("🔴 General error: $e");
      throw Exception("Unknown error occurred");
    }
  }
  Future<List<PriceCountModel>> fetchProductCountPrice() async {
    try{
      final response = await _dio.get('/products-price-count/',
        queryParameters: {
          'ranges':'0-50,50-100,100-200,200-500,500-1000,1000-2000,2000-3000'
        }
      );
      final List data = response.data['counts'];

      return data.map((json) => PriceCountModel.fromJson(json)).toList();

    }catch(e){
      print("🔴 General error: $e");
      throw Exception("Unknown error occurred");
    }
  }
  Future<List<CategoryCountModel>> fetchProductCategoryCount() async {
    try{
      final response = await _dio.get('/category-product-count/');
      final List data = response.data;
      return data.map((json) => CategoryCountModel.fromJson(json)).toList();
  }catch(e){
    print("🔴 General error: $e");
    throw Exception("Unknown error occurred");
    }
  }
}
