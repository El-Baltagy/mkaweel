class AddressModel {
  final String? displayName;
  final String? city;
  final String? state;
  final String? country;
  final String? postcode;
  final String? road;

  const AddressModel({
    this.displayName,
    this.city,
    this.state,
    this.country,
    this.postcode,
    this.road,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    final address = json['address'] as Map<String, dynamic>?;

    return AddressModel(
      displayName: json['display_name']as String?,
      city:( address?['city'] ??
          address?['town'] ??
          address?['village'] ??
          address?['municipality']) as String?,
      state: address?['state']as String?,
      country: address?['country']as String?,
      postcode: address?['postcode']as String?,
      road: address?['road']as String?,
    );
  }

  @override
  String toString() {
    return [
      road,
      city,
      state,
      country,
    ].where((e) => e != null && e!.isNotEmpty).join(', ');
  }
}