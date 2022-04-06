import 'city.dart';
import 'country.dart';
import 'governorate.dart';
import 'location.dart';
import 'region.dart';

class Address {
  Address({
    this.id,
    this.addressableId,
    this.addressableType,
    this.nearBy,
    this.regionId,
    this.cityId,
    this.governorateId,
    this.countryId,
    this.createdAt,
    this.updatedAt,
    this.country,
    this.governorate,
    this.city,
    this.region,
    this.location,
  });
  int? id;
  int? addressableId;
  String? addressableType;
  String? nearBy;
  int? regionId;
  int? cityId;
  int? governorateId;
  int? countryId;
  Null? createdAt;
  Null? updatedAt;
  Country? country;
  Governorate? governorate;
  City? city;
  Region? region;
  Location? location;

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    addressableId = json['addressable_id'];
    addressableType = json['addressable_type'];
    nearBy = json['near_by'];
    regionId = json['region_id'];
    cityId = json['city_id'];
    governorateId = json['governorate_id'];
    countryId = json['country_id'];
    createdAt = null;
    updatedAt = null;

    if (json['country'] != null) {
      country = Country.fromJson(json['country']);
    }
    if (json['governorate'] != null) {
      governorate = Governorate.fromJson(json['governorate']);
    }
    if (json['city'] != null) {
      city = City.fromJson(json['city']);
    }
    if (json['region'] != null) {
      region = Region.fromJson(json['region']);
    }
    if (json['location'] != null) {
      location = Location.fromJson(json['location']);
    }
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['addressable_id'] = addressableId;
    _data['addressable_type'] = addressableType;
    _data['near_by'] = nearBy;
    _data['region_id'] = regionId;
    _data['city_id'] = cityId;
    _data['governorate_id'] = governorateId;
    _data['country_id'] = countryId;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['country'] = country?.toJson();
    _data['governorate'] = governorate?.toJson();
    _data['city'] = city?.toJson();
    _data['region'] = region?.toJson();
    _data['location'] = location?.toJson();
    return _data;
  }
}
