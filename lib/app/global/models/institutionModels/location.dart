class Location {
  Location({
    required this.id,
    required this.latitude,
    required this.longitude,
    required this.name,
    required this.locationableId,
    required this.locationableType,
    required this.addressId,
  });
  late final int id;
  late final double latitude;
  late final double longitude;
  late final String name;
  late final int locationableId;
  late final String locationableType;
  late final int addressId;

  Location.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    name = json['name'];
    locationableId = json['locationable_id'];
    locationableType = json['locationable_type'];
    addressId = json['address_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['latitude'] = latitude;
    _data['longitude'] = longitude;
    _data['name'] = name;
    _data['locationable_id'] = locationableId;
    _data['locationable_type'] = locationableType;
    _data['address_id'] = addressId;
    return _data;
  }
}
