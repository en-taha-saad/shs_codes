// ignore_for_file: prefer_void_to_null

import 'city.dart';
import 'country.dart';
import 'governorate.dart';
import 'location.dart';
import 'region.dart';

class Address {
  Address({
    required this.id,
    required this.addressableId,
    required this.addressableType,
    required this.nearBy,
    required this.regionId,
    required this.cityId,
    required this.governorateId,
    required this.countryId,
    this.createdAt,
    this.updatedAt,
    required this.country,
    required this.governorate,
    required this.city,
    required this.region,
    required this.location,
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
    country = Country.fromJson(json['country']);
    governorate = Governorate.fromJson(json['governorate']);
    city = City.fromJson(json['city']);
    region = Region.fromJson(json['region']);
    location = Location.fromJson(json['location']);
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
