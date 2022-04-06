// class User {
//   int? currentPage;
//   List<dynamic>? data;
//   String? firstPageUrl;
//   int? from;
//   int? lastPage;
//   String? lastPageUrl;
//   List<Links>? links;
//   String? nextPageUrl;
//   String? path;
//   String? perPage;
//   dynamic prevPageUrl;
//   int? to;
//   int? total;
//
//   User(
//       {this.currentPage,
//       this.data,
//       this.firstPageUrl,
//       this.from,
//       this.lastPage,
//       this.lastPageUrl,
//       this.links,
//       this.nextPageUrl,
//       this.path,
//       this.perPage,
//       this.prevPageUrl,
//       this.to,
//       this.total});
//
//   User.fromJson(Map<String, dynamic> json) {
//     currentPage = json['current_page'];
//     if (json['data'] != null) {
//       data = <SingleDrug>[];
//       json['data'].forEach((v) {
//         data!.add(SingleDrug.fromJson(v));
//       });
//     }
//     firstPageUrl = json['first_page_url'];
//     from = json['from'];
//     lastPage = json['last_page'];
//     lastPageUrl = json['last_page_url'];
//     if (json['links'] != null) {
//       links = <Links>[];
//       json['links'].forEach((v) {
//         links!.add(Links.fromJson(v));
//       });
//     }
//     nextPageUrl = json['next_page_url'];
//     path = json['path'];
//     perPage = json['per_page'];
//     prevPageUrl = json['prev_page_url'];
//     to = json['to'];
//     total = json['total'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['current_page'] = currentPage;
//     if (data['data'] != null) {
//       data['data'] = data['data'].map((v) => v.toJson()).toList();
//     }
//     data['first_page_url'] = firstPageUrl;
//     data['from'] = from;
//     data['last_page'] = lastPage;
//     data['last_page_url'] = lastPageUrl;
//     if (links != null) {
//       data['links'] = links!.map((v) => v.toJson()).toList();
//     }
//     data['next_page_url'] = nextPageUrl;
//     data['path'] = path;
//     data['per_page'] = perPage;
//     data['prev_page_url'] = prevPageUrl;
//     data['to'] = to;
//     data['total'] = total;
//     return data;
//   }
// }
//
// class SingleDrug {
//   int? id;
//   String? languageCode;
//   String? tradeName;
//   String? strength;
//   String? genericName;
//   String? dosageForm;
//   String? routeOfAdministration;
//   String? packageSize;
//   String? manufacturer;
//   String? distributor;
//   int? drugId;
//   Drug? drug;
//   Image? image;
//   int? id;
//   String? mohCode;
//   String? gs1Code;
//
//   SingleDrug(
//       {this.id,
//       this.languageCode,
//       this.tradeName,
//       this.strength,
//       this.genericName,
//       this.dosageForm,
//       this.routeOfAdministration,
//       this.packageSize,
//       this.manufacturer,
//       this.distributor,
//       this.drugId,
//       this.drug,
//       this.image});
//
//   SingleDrug.fromJson(Map<String, dynamic> json) {
//     id = json["drug_descriptions"]['id'];
//     languageCode = json["drug_descriptions"]['language_code'];
//     tradeName = json["drug_descriptions"]['trade_name'];
//     strength = json["drug_descriptions"]['strength'];
//     genericName = json["drug_descriptions"]['generic_name'];
//     dosageForm = json["drug_descriptions"]['dosage_form'];
//     routeOfAdministration = json["drug_descriptions"]['route_of_administration'];
//     packageSize = json["drug_descriptions"]['package_size'];
//     manufacturer = json["drug_descriptions"]['manufacturer'];
//     distributor = json["drug_descriptions"]['distributor'];
//     drugId = json["drug_descriptions"]['drug_id'];
//     drug = json['drug'] != null ? Drug?.fromJson(json['drug']) : null;
//     image = json["drug_descriptions"]['image'] != null ? Image?.fromJson(json['image']) : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['id'] = id;
//     data['language_code'] = languageCode;
//     data['trade_name'] = tradeName;
//     data['strength'] = strength;
//     data['generic_name'] = genericName;
//     data['dosage_form'] = dosageForm;
//     data['route_of_administration'] = routeOfAdministration;
//     data['package_size'] = packageSize;
//     data['manufacturer'] = manufacturer;
//     data['distributor'] = distributor;
//     data['drug_id'] = drugId;
//     if (drug != null) {
//       data['drug'] = drug!.toJson();
//     }
//     if (image != null) {
//       data['image'] = image!.toJson();
//     }
//     return data;
//   }
// }
//
// class Drug {
//   int? id;
//   String? mohCode;
//   String? gs1Code;
//
//   Drug({this.id, this.mohCode, this.gs1Code});
//
//   Drug.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     mohCode = json['moh_code'];
//     gs1Code = json['gs1_code'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['id'] = id;
//     data['moh_code'] = mohCode;
//     data['gs1_code'] = gs1Code;
//     return data;
//   }
// }
//
// class Image {
//   int? id;
//   String? imageUrl;
//   int? imageableId;
//   String? imageableType;
//   dynamic createdAt;
//   dynamic updatedAt;
//
//   Image(
//       {this.id,
//       this.imageUrl,
//       this.imageableId,
//       this.imageableType,
//       this.createdAt,
//       this.updatedAt});
//
//   Image.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     imageUrl = json['image_url'];
//     imageableId = json['imageable_id'];
//     imageableType = json['imageable_type'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['id'] = id;
//     data['image_url'] = imageUrl;
//     data['imageable_id'] = imageableId;
//     data['imageable_type'] = imageableType;
//     data['created_at'] = createdAt;
//     data['updated_at'] = updatedAt;
//     return data;
//   }
// }
//
// class Links {
//   String? url;
//   String? label;
//   bool? active;
//
//   Links({this.url, this.label, this.active});
//
//   Links.fromJson(Map<String, dynamic> json) {
//     url = json['url'];
//     label = json['label'];
//     active = json['active'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final data = <String, dynamic>{};
//     data['url'] = url;
//     data['label'] = label;
//     data['active'] = active;
//     return data;
//   }
// }



