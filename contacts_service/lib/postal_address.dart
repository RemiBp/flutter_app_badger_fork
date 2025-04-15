/// Represents a postal address for a contact.
class PostalAddress {
  String? label;
  String? street;
  String? city;
  String? postcode;
  String? region;
  String? country;

  PostalAddress({
    this.label,
    this.street,
    this.city,
    this.postcode,
    this.region,
    this.country,
  });

  PostalAddress.fromMap(Map<dynamic, dynamic> map) {
    label = map["label"];
    street = map["street"];
    city = map["city"];
    postcode = map["postcode"];
    region = map["region"];
    country = map["country"];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'label': label,
      'street': street,
      'city': city,
      'postcode': postcode,
      'region': region,
      'country': country,
    };
  }

  @override
  String toString() =>
      'PostalAddress(label: $label, street: $street, city: $city, postcode: $postcode, region: $region, country: $country)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PostalAddress &&
        other.label == label &&
        other.street == street &&
        other.city == city &&
        other.postcode == postcode &&
        other.region == region &&
        other.country == country;
  }

  @override
  int get hashCode =>
      label.hashCode ^
      street.hashCode ^
      city.hashCode ^
      postcode.hashCode ^
      region.hashCode ^
      country.hashCode;
} 