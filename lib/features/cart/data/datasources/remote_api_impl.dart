import 'package:dio/dio.dart';
import 'package:tech_store/Core/network/private_dio.dart';
import 'package:tech_store/features/cart/data/datasources/remote_api.dart';
import 'package:tech_store/features/cart/data/models/cart_model.dart';
import 'package:tech_store/features/cart/data/models/cart_update_model.dart';

class RemoteApiImpl implements RemoteApi{
  final Dio _dio=PrivateDio.dio;

  @override
  Future<CartModel> getCart() async{
    try{
      final response=await _dio.get('/cartlist/');
      return CartModel.fromJson(response.data['results'][0]);

    }catch(e){
      print("Error: $e");
      throw Exception("Failed to fetch cart");
    }
  }

  @override
  Future<void> updateCart(CartUpdateModel cart,int id) async {
    try{
      await _dio.put('/carteditems/updatedeleteretrieve/${id}/', data: cart.toJson());
    }catch(e){
      print("Error: $e");
      throw Exception("Failed to update cart");
    }
  }

  @override
  Future<void> deleteCart(int id) {
    try{
      return _dio.delete('/carteditems/updatedeleteretrieve/${id}/');
    }catch(e){
      print("Error: $e");
      throw Exception("Failed to delete cart");
    }
  }

  @override
  Future<void> clearCart() async {
    try{
      await _dio.delete('/cart/clear/');
    }catch(e){
      print("Error: $e");
      throw Exception("Failed to clear cart");
    }
  }

}