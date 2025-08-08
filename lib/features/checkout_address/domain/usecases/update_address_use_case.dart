import 'package:tech_store/features/checkout_address/domain/entities/address.dart';
import 'package:tech_store/features/checkout_address/domain/repository/checkout_repository.dart';

class UpdateAddressUseCase{
  final CheckoutRepository repository;
  UpdateAddressUseCase(this.repository);
  Future<void> call(int id,Address address){
    return repository.updateAddress(id,address);
  }
}