import 'package:tech_store/features/checkout_address/domain/entities/address.dart';
import 'package:tech_store/features/checkout_address/domain/repository/checkout_repository.dart';

class SaveAddressUseCase{
  final CheckoutRepository repository;
  SaveAddressUseCase(this.repository);
  Future<void> call(Address address){
    return repository.saveAddress(address);
  }

}