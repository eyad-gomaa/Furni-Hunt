class AddressModel {
  final String governorate;
  final String city;
  final String street;
  final String additionalDetails;

  AddressModel({
    required this.governorate,
    required this.city,
    required this.street,
    required this.additionalDetails,
  });
  factory AddressModel.fromJson(json) {
    return AddressModel(
        governorate: json['governorate'],
        city: json['city'],
        street: json['street'],
        additionalDetails: json['additionalDetails']);
  }
  Map<String, String> toJson() {
    return {
      "governorate": governorate,
      "city": city,
      "street": street,
      "additionalDetails": additionalDetails
    };
  }
}
