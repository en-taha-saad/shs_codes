// ignore_for_file: prefer_void_to_null

import 'service.dart';

class ServiceFees {
  ServiceFees({
    this.id,
    this.serviceFeeableId,
    this.serviceFeeableType,
    this.serviceId,
    this.other,
    this.price,
    this.currency,
    this.createdAt,
    this.updatedAt,
    this.service,
  });
  int? id;
  int? serviceFeeableId;
  String? serviceFeeableType;
  int? serviceId;
  String? other;
  int? price;
  String? currency;
  Null createdAt;
  Null updatedAt;
  Service? service;

  ServiceFees.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    serviceFeeableId = json['service_feeable_id'];
    serviceFeeableType = json['service_feeable_type'];
    serviceId = json['service_id'];
    other = json['other'];
    price = json['price'];
    currency = json['currency'];
    createdAt = null;
    updatedAt = null;
    service = Service.fromJson(json['service']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['service_feeable_id'] = serviceFeeableId;
    _data['service_feeable_type'] = serviceFeeableType;
    _data['service_id'] = serviceId;
    _data['other'] = other;
    _data['price'] = price;
    _data['currency'] = currency;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['service'] = service?.toJson();
    return _data;
  }
}
