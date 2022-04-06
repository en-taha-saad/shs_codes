class Location {
  Location({
    this.id,
    this.latitude,
    this.longitude,
    this.name,
    this.locationableId,
    this.locationableType,
    this.addressId,
  });
  int? id;
  double? latitude;
  double? longitude;
  String? name;
  int? locationableId;
  String? locationableType;
  int? addressId;

  Location.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    latitude = json['latitude'] / 1.0;
    longitude = json['longitude'] / 1.0;
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
