import 'package:dio/dio.dart';
import 'package:tech_store/Core/network/public_dio.dart';
import 'package:tech_store/features/products-details/data/datasources/remote/remote_api.dart';
import 'package:tech_store/features/products-details/data/models/product_detail_model.dart';
import 'package:tech_store/features/products-details/domain/entities/product_detailed.dart';

class ProductsDetailRemoteDataImpl implements ProductsDetailRemoteData{
  final Dio _dio = PublicDio.dio;

  @override
  Future<ProductDetailModel> getProductDetail(int id) async {
   try{
     final response =await _dio.get('/products/$id');

      return ProductDetailModel.fromJson(response.data);


   }catch(e){
     print("🔴 General error: $e");
     throw Exception("Unknown error occurred");
   }
  }

}