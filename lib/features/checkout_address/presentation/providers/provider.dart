
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_store/features/checkout_address/data/datasources/remote_api_impl.dart';
import 'package:tech_store/features/checkout_address/data/repository/address_repo_impl.dart';
import 'package:tech_store/features/checkout_address/domain/entities/address.dart';
import 'package:tech_store/features/checkout_address/domain/repository/checkout_repository.dart';
import 'package:tech_store/features/checkout_address/domain/usecases/fetch_address_use_case.dart';
import 'package:tech_store/features/checkout_address/domain/usecases/save_address_use_case.dart';
import 'package:tech_store/features/checkout_address/domain/usecases/update_address_use_case.dart';
import 'package:tech_store/features/checkout_address/presentation/viewmodels/address_view_model.dart';

final repositoryProvider=Provider<CheckoutRepository>((ref) {
  return AddressRepositoryImpl(RemoteApiImpl());
});

final fetchUseCaseProvider=Provider<FetchAddressUseCase>((ref) {
  return FetchAddressUseCase(ref.watch(repositoryProvider));
});

final updateUseCaseProvider=Provider<UpdateAddressUseCase>((ref) {
  return UpdateAddressUseCase(ref.watch(repositoryProvider));
});
final createUseCaseProvider=Provider<SaveAddressUseCase>((ref) {
  return SaveAddressUseCase(ref.watch(repositoryProvider));
});


final addressViewModelProvider=StateNotifierProvider<AddressViewModel,AsyncValue<Address?>>((ref) {
  return AddressViewModel(ref.watch(fetchUseCaseProvider),ref.watch(updateUseCaseProvider
  ),ref.watch(createUseCaseProvider));
});
final selectedProvider=StateProvider<String?>((ref) => '');
