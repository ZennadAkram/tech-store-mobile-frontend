import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tech_store/features/checkout_address/domain/entities/address.dart';
import 'package:tech_store/features/checkout_address/domain/usecases/fetch_address_use_case.dart';
import 'package:tech_store/features/checkout_address/domain/usecases/save_address_use_case.dart';
import 'package:tech_store/features/checkout_address/domain/usecases/update_address_use_case.dart';

class AddressViewModel extends StateNotifier<AsyncValue<Address?>>{
  final FetchAddressUseCase _fetchAddressUseCase;
  final UpdateAddressUseCase _updateAddressUseCase;
  final SaveAddressUseCase _saveAddressUseCase;
  AddressViewModel(this._fetchAddressUseCase, this._updateAddressUseCase, this._saveAddressUseCase ):super(const AsyncLoading()){
    fetchAddress();
  }
  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController zipController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController addressTypeController = TextEditingController();

  int? id;
  Future<void> fetchAddress() async{
    state = const AsyncLoading();

    try{
      final address = await _fetchAddressUseCase();
      state = AsyncValue.data(address);
      if (address != null) {
        id = address.id;
        emailController.text = address.email ;
        firstNameController.text = address.first_name;
        lastNameController.text = address.last_name;
        phoneController.text = address.phone_number;
        addressController.text = address.street_address;
        cityController.text = address.city;
        stateController.text = address.state;
        zipController.text = address.postal_code;
        countryController.text = address.country;
        addressTypeController.text = address.address_type;
      }
    }catch(e,st){
      state = AsyncValue.error(e,st);

    }
  }

  void updateOrCreateAddress(Address address) {
    if (address.id != null) {
      updateAddress(address);
    } else {
      saveAddress(address);
    }
  }
  Future<void> updateAddress(Address address) async{
    state = const AsyncLoading();
    try{
     await _updateAddressUseCase(address.id!,address);

    }catch(e,st){
      state = AsyncValue.error(e,st);
    }
  }

  Future<void> saveAddress(Address address) async{
    state = const AsyncLoading();
    try{
      await _saveAddressUseCase(address);
      state = const AsyncValue.data(null);
    }catch(e,st){
      state = AsyncValue.error(e,st);
    }
  }

  @override
  void dispose() {
    // Dispose controllers to prevent memory leaks
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    cityController.dispose();
    stateController.dispose();
    zipController.dispose();
    countryController.dispose();
    addressTypeController.dispose();
    super.dispose();
  }
}