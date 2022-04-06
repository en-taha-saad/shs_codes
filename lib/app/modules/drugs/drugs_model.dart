class Drugs {
  int? currentPage;
  List<SingleDrug>? singleDrug;
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

  Drugs(
      {this.currentPage,
      this.singleDrug,
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

  Drugs.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['singleDrug'] != null) {
      singleDrug = <SingleDrug>[];
      json['singleDrug'].forEach((v) {
        singleDrug!.add(SingleDrug.fromJson(v));
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
    final singleDrug = <String, dynamic>{};
    singleDrug['current_page'] = currentPage;
    // ignore: unnecessary_null_comparison
    if (singleDrug != null) {
      singleDrug['singleDrug'] = singleDrug['singleDrug'].map((v) => v.toJson()).toList();
    }
    singleDrug['first_page_url'] = firstPageUrl;
    singleDrug['from'] = from;
    singleDrug['last_page'] = lastPage;
    singleDrug['last_page_url'] = lastPageUrl;
    if (links != null) {
      singleDrug['links'] = links!.map((v) => v.toJson()).toList();
    }
    singleDrug['next_page_url'] = nextPageUrl;
    singleDrug['path'] = path;
    singleDrug['per_page'] = perPage;
    singleDrug['prev_page_url'] = prevPageUrl;
    singleDrug['to'] = to;
    singleDrug['total'] = total;
    return singleDrug;
  }
}

class SingleDrug {
  int? id;
  String? mohCode;
  String? gs1Code;
  List<DrugDescriptions>? drugDescriptions;

  SingleDrug({this.id, this.mohCode, this.gs1Code, this.drugDescriptions});

  SingleDrug.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mohCode = json['moh_code'];
    gs1Code = json['gs1_code'];
    if (json['drug_descriptions'] != null) {
      drugDescriptions = <DrugDescriptions>[];
      json['drug_descriptions'].forEach((v) {
        drugDescriptions!.add(DrugDescriptions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final singleDrug = <String, dynamic>{};
    singleDrug['id'] = id;
    singleDrug['moh_code'] = mohCode;
    singleDrug['gs1_code'] = gs1Code;
    if (drugDescriptions != null) {
      singleDrug['drug_descriptions'] =
          drugDescriptions!.map((v) => v.toJson()).toList();
    }
    return singleDrug;
  }
}

class DrugDescriptions {
  int? id;
  String? languageCode;
  String? tradeName;
  String? strength;
  String? genericName;
  String? dosageForm;
  String? routeOfAdministration;
  String? packageSize;
  String? manufacturer;
  String? distributor;
  int? drugId;
  Image? image;

  DrugDescriptions(
      {this.id,
      this.languageCode,
      this.tradeName,
      this.strength,
      this.genericName,
      this.dosageForm,
      this.routeOfAdministration,
      this.packageSize,
      this.manufacturer,
      this.distributor,
      this.drugId,
      this.image});

  DrugDescriptions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    languageCode = json['language_code'];
    tradeName = json['trade_name'];
    strength = json['strength'];
    genericName = json['generic_name'];
    dosageForm = json['dosage_form'];
    routeOfAdministration = json['route_of_administration'];
    packageSize = json['package_size'];
    manufacturer = json['manufacturer'];
    distributor = json['distributor'];
    drugId = json['drug_id'];
    image = json['image'] != null ? Image?.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final singleDrug = <String, dynamic>{};
    singleDrug['id'] = id;
    singleDrug['language_code'] = languageCode;
    singleDrug['trade_name'] = tradeName;
    singleDrug['strength'] = strength;
    singleDrug['generic_name'] = genericName;
    singleDrug['dosage_form'] = dosageForm;
    singleDrug['route_of_administration'] = routeOfAdministration;
    singleDrug['package_size'] = packageSize;
    singleDrug['manufacturer'] = manufacturer;
    singleDrug['distributor'] = distributor;
    singleDrug['drug_id'] = drugId;
    if (image != null) {
      singleDrug['image'] = image!.toJson();
    }
    return singleDrug;
  }
}

class Image {
  int? id;
  String? imageUrl;
  int? imageableId;
  String? imageableType;
  int? isProfile;
  dynamic createdAt;
  dynamic updatedAt;

  Image(
      {this.id,
      this.imageUrl,
      this.imageableId,
      this.imageableType,
      this.isProfile,
      this.createdAt,
      this.updatedAt});

  Image.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['image_url'];
    imageableId = json['imageable_id'];
    imageableType = json['imageable_type'];
    isProfile = json['is_profile'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final singleDrug = <String, dynamic>{};
    singleDrug['id'] = id;
    singleDrug['image_url'] = imageUrl;
    singleDrug['imageable_id'] = imageableId;
    singleDrug['imageable_type'] = imageableType;
    singleDrug['is_profile'] = isProfile;
    singleDrug['created_at'] = createdAt;
    singleDrug['updated_at'] = updatedAt;
    return singleDrug;
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
    final singleDrug = <String, dynamic>{};
    singleDrug['url'] = url;
    singleDrug['label'] = label;
    singleDrug['active'] = active;
    return singleDrug;
  }
}
