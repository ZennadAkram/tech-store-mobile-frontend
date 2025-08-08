class Address{
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
  Address({
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
    this.id
});
}