import 'package:tech_store/features/checkout_address/domain/entities/address.dart';

abstract class CheckoutRepository{
  Future<Address?> getAddress();
  Future<void> updateAddress(int id, Address address);
  Future<void> removeAddress(int id);
 Future<void> saveAddress(Address address);

}
