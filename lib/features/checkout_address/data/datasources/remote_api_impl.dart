import 'package:dio/dio.dart';
import 'package:tech_store/Core/network/private_dio.dart';
import 'package:tech_store/features/checkout_address/data/datasources/remote_api.dart';
import 'package:tech_store/features/checkout_address/data/models/address_model.dart';

class RemoteApiImpl implements RemoteApi{
  final Dio _dio=PrivateDio.dio;
  @override
  Future<AddressModel?> getAddress() async {
    try {
      final response = await _dio.get('/addresses/');
      final results = response.data['results'] as List;

      if (results.isNotEmpty) {
        return AddressModel.fromJson(results[0]);
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }


  @override
  Future<void> updateAddress(int id, AddressModel model) async{
   try{
     await _dio.put('/addresses/$id/',data:model.toJson());
   }catch(e){
     print(e.toString());


   }
  }

  @override
  Future<void> deleteAddress(int id) async{
   try{
   await _dio.delete('/addresses/$id/');
   }catch(e){
     print(e.toString());
   }
  }

  @override
  Future<void> createAddress(AddressModel model) async {
    try{
      await _dio.put('/addresses/',data:model.toJson());
    }catch(e){
      print(e.toString());


    }
  }

}