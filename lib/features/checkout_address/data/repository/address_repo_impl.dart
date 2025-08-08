import 'package:tech_store/features/checkout_address/data/datasources/remote_api.dart';
import 'package:tech_store/features/checkout_address/data/models/address_model.dart';
import 'package:tech_store/features/checkout_address/domain/entities/address.dart';
import 'package:tech_store/features/checkout_address/domain/repository/checkout_repository.dart';

class AddressRepositoryImpl implements CheckoutRepository {
final RemoteApi _api;
  AddressRepositoryImpl(this._api);
  @override
  Future<Address?> getAddress() async {
   final model = await _api.getAddress();
   return model?.toEntity();
  }

  @override
  Future<void> updateAddress(int id, Address address) async{
    final model=AddressModel.fromEntity(address);
    await _api.updateAddress(id, model);

  }

  @override
  Future<void> removeAddress(int id) async{
    await _api.deleteAddress(id);
  }

  @override
  Future<void> saveAddress(Address address) {
    final model=AddressModel.fromEntity(address);
    return _api.createAddress(model);
  }

}