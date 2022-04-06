class Phar {
  int? currentPage;
  List<SinglePharmacy>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Links>? links;
  String? nextPageUrl;
  String? path;
  String? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  Phar(
      {this.currentPage,
      this.data,
      this.firstPageUrl,
      this.from,
      this.lastPage,
      this.lastPageUrl,
      this.links,
      this.nextPageUrl,
      this.path,
      this.perPage,
      this.prevPageUrl,
      this.to,
      this.total});

  Phar.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <SinglePharmacy>[];
      json['data'].forEach((v) {
        data!.add(SinglePharmacy.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links!.add(Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['current_page'] = currentPage;
    // ignore: unnecessary_null_comparison
    if (data != null) {
      data['data'] = data['data'].map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = firstPageUrl;
    data['from'] = from;
    data['last_page'] = lastPage;
    data['last_page_url'] = lastPageUrl;
    if (links != null) {
      data['links'] = links!.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = nextPageUrl;
    data['path'] = path;
    data['per_page'] = perPage;
    data['prev_page_url'] = prevPageUrl;
    data['to'] = to;
    data['total'] = total;
    return data;
  }
}

class SinglePharmacy {
  int? id;
  String? name;
  String? about;
  int? hasCosmetics;
  int? sentinel;
  int? hasMedicalDevices;
  List<Addresses>? addresses;
  List<Locations>? locations;
  User? user;
  dynamic image;

  SinglePharmacy(
      {this.id,
      this.name,
      this.about,
      this.hasCosmetics,
      this.sentinel,
      this.hasMedicalDevices,
      this.addresses,
      this.locations,
      this.user,
      this.image});

  SinglePharmacy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    about = json['about'];
    hasCosmetics = json['has_Cosmetics'];
    sentinel = json['sentinel'];
    hasMedicalDevices = json['has_medical_devices'];
    if (json['addresses'] != null) {
      addresses = <Addresses>[];
      json['addresses'].forEach((v) {
        addresses!.add(Addresses.fromJson(v));
      });
    }
    if (json['locations'] != null) {
      locations = <Locations>[];
      json['locations'].forEach((v) {
        locations!.add(Locations.fromJson(v));
      });
    }
    user = json['user'] != null ? User?.fromJson(json['user']) : null;
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['about'] = about;
    data['has_Cosmetics'] = hasCosmetics;
    data['sentinel'] = sentinel;
    data['has_medical_devices'] = hasMedicalDevices;
    if (addresses != null) {
      data['addresses'] = addresses!.map((v) => v.toJson()).toList();
    }
    if (locations != null) {
      data['locations'] = locations!.map((v) => v.toJson()).toList();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['image'] = image;
    return data;
  }
}

class Addresses {
  int? id;
  int? addressableId;
  String? addressableType;
  int? cityId;
  int? governorateId;
  int? countryId;
  dynamic createdAt;
  dynamic updatedAt;
  Country? country;
  Governorate? governorate;
  City? city;

  Addresses(
      {this.id,
      this.addressableId,
      this.addressableType,
      this.cityId,
      this.governorateId,
      this.countryId,
      this.createdAt,
      this.updatedAt,
      this.country,
      this.governorate,
      this.city});

  Addresses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    addressableId = json['addressable_id'];
    addressableType = json['addressable_type'];
    cityId = json['city_id'];
    governorateId = json['governorate_id'];
    countryId = json['country_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    country = json['country'] != null ? Country?.fromJson(json['country']) :
    null;
    governorate = json['governorate'] != null
        ? Governorate?.fromJson(json['governorate'])
        : null;
    city = json['city'] != null ? City?.fromJson(json['city']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['addressable_id'] = addressableId;
    data['addressable_type'] = addressableType;
    data['city_id'] = cityId;
    data['governorate_id'] = governorateId;
    data['country_id'] = countryId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (country != null) {
      data['country'] = country!.toJson();
    }
    if (governorate != null) {
      data['governorate'] = governorate!.toJson();
    }
    if (city != null) {
      data['city'] = city!.toJson();
    }
    return data;
  }
}

class Locations {
  int? id;
  double? latitude;
  double? longitude;
  String? name;
  int? locationableId;
  String? locationableType;
  int? addressId;
  dynamic createdAt;
  dynamic updatedAt;

  Locations(
      {this.id,
      this.latitude,
      this.longitude,
      this.name,
      this.locationableId,
      this.locationableType,
      this.addressId,
      this.createdAt,
      this.updatedAt});

  Locations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    name = json['name'];
    locationableId = json['locationable_id'];
    locationableType = json['locationable_type'];
    addressId = json['address_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['latitude'] = latitude;

    data['longitude'] = longitude;
    data['name'] = name;
    data['locationable_id'] = locationableId;
    data['locationable_type'] = locationableType;
    data['address_id'] = addressId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class User {
  int? userableId;
  String? userableType;
  int? id;
  List<Phones>? phones;

  User({this.userableId, this.userableType, this.id, this.phones});

  User.fromJson(Map<String, dynamic> json) {
    userableId = json['userable_id'];
    userableType = json['userable_type'];
    id = json['id'];
    if (json['phones'] != null) {
      phones = <Phones>[];
      json['phones'].forEach((v) {
        phones!.add(Phones.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['userable_id'] = userableId;
    data['userable_type'] = userableType;
    data['id'] = id;
    if (phones != null) {
      data['phones'] = phones!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Phones {
  int? id;
  String? phone;
  dynamic phoneVerifiedAt;
  int? userId;
  int? primary;
  dynamic createdAt;
  dynamic updatedAt;

  Phones(
      {this.id,
      this.phone,
      this.phoneVerifiedAt,
      this.userId,
      this.primary,
      this.createdAt,
      this.updatedAt});

  Phones.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    phone = json['phone'];
    phoneVerifiedAt = json['phone_verified_at'];
    userId = json['user_id'];
    primary = json['primary'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['phone'] = phone;
    data['phone_verified_at'] = phoneVerifiedAt;
    data['user_id'] = userId;
    data['primary'] = primary;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['url'] = url;
    data['label'] = label;
    data['active'] = active;
    return data;
  }
}

class Country {
  int? id;
  String? name;

  Country({this.id, this.name});

  Country.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class Governorate {
  int? id;
  String? name;

  Governorate({this.id, this.name});

  Governorate.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}

class City {
  int? id;
  String? name;

  City({this.id, this.name});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
