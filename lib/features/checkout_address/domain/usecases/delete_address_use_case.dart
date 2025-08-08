import 'package:tech_store/features/checkout_address/domain/repository/checkout_repository.dart';

class DeleteAddressUseCase{
  final CheckoutRepository repository;
  DeleteAddressUseCase(this.repository);
  Future<void> call(int addressId) {
    return repository.removeAddress(addressId);
  }
}