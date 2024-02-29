class MegaKassaKkmRegistrationStep2Entity {
  final String index;
  final String region;
  final String locality;
  final String street;
  final String houseNumber;
  final String long;
  final String lat;

  MegaKassaKkmRegistrationStep2Entity({
    required this.index,
    required this.region,
    required this.locality,
    required this.street,
    required this.houseNumber,
    required this.long,
    required this.lat,
  });

  MegaKassaKkmRegistrationStep2Entity copyWith({
    String? index,
    String? region,
    String? locality,
    String? street,
    String? houseNumber,
    String? long,
    String? lat,
  }) {
    return MegaKassaKkmRegistrationStep2Entity(
      index: index ?? this.index,
      region: region ?? this.region,
      locality: locality ?? this.locality,
      street: street ?? this.street,
      houseNumber: houseNumber ?? this.houseNumber,
      long: long ?? this.long,
      lat: lat ?? this.lat,
    );
  }

  @override
  String toString() {
    return 'MegaKassaKkmRegistrationStep2Entity(index: $index, region: $region, locality: $locality, street: $street, houseNumber: $houseNumber, long: $long, lat: $lat)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MegaKassaKkmRegistrationStep2Entity &&
        other.index == index &&
        other.region == region &&
        other.locality == locality &&
        other.street == street &&
        other.houseNumber == houseNumber &&
        other.long == long &&
        other.lat == lat;
  }

  @override
  int get hashCode {
    return index.hashCode ^
        region.hashCode ^
        locality.hashCode ^
        street.hashCode ^
        houseNumber.hashCode ^
        long.hashCode ^
        lat.hashCode;
  }
}
