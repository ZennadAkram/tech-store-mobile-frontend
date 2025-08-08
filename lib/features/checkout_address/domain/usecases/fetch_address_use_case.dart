import 'package:tech_store/features/checkout_address/domain/entities/address.dart';
import 'package:tech_store/features/checkout_address/domain/repository/checkout_repository.dart';

class FetchAddressUseCase{
  final CheckoutRepository repository;
  FetchAddressUseCase(this.repository);
  Future<Address?> call(){
    return repository.getAddress();

  }
}