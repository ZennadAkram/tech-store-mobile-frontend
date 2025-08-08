import 'package:tech_store/features/checkout_address/domain/entities/address.dart';

class AddressModel{
  int? id;
  String email;
  String first_name;
  String last_name;
  String phone_number;
  String street_address;
  String city;
  String state;
  String postal_code;
  String country;
  String address_type;
  AddressModel({
    required this.email,
    required this.first_name,
    required this.last_name,
    required this.phone_number,
    required this.street_address,
    required this.city,
    required this.state,
    required this.postal_code,
    required this.country,
    required this.address_type,
    this.id,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      id: json['id'],
      email: json['email'],
      first_name: json['first_name'],
      last_name: json['last_name'],
      phone_number: json['phone_number'],
      street_address: json['street_address'],
      city: json['city'],
      state: json['state'],
      postal_code: json['postal_code'],
      country: json['country'],
      address_type: json['address_type'],

    );

  }
  Map<String, dynamic> toJson() {
    return{
      'email': email,
      'first_name': first_name,
      'last_name': last_name,
      'phone_number': phone_number,
      'street_address': street_address,
      'city': city,
      'state': state,
      'postal_code': postal_code,
      'country': country,
      'address_type': address_type,

    };
  }
  Address toEntity(){
    return Address(
      id: id,
      email: email,
      first_name: first_name,
      last_name: last_name,
      phone_number: phone_number,
      street_address: street_address,
      city: city,
      state: state,
      postal_code: postal_code,
      country: country,
      address_type: address_type,

    );
  }
 factory AddressModel.fromEntity(Address address){
    return AddressModel(
      id: address.id,
      email: address.email,
      first_name: address.first_name,
      last_name: address.last_name,
      phone_number: address.phone_number,
      street_address: address.street_address,
      city: address.city,
      state: address.state,
      postal_code: address.postal_code,
      country: address.country,
      address_type: address.address_type,

    );
  }
}