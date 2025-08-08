import 'package:tech_store/features/checkout_address/data/models/address_model.dart';

abstract class RemoteApi{
Future<AddressModel?> getAddress();
Future<void> updateAddress(int id, AddressModel model);
Future<void> deleteAddress(int id);
Future<void> createAddress(AddressModel model);

}