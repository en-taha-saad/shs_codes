class StaffImage {
  StaffImage({
    this.id,
    this.imageUrl,
    this.imageableId,
    this.imageableType,
    this.isProfile,
    this.isCover,
    this.createdAt,
    this.updatedAt,
  });
  int? id;
  String? imageUrl;
  int? imageableId;
  String? imageableType;
  int? isProfile;
  int? isCover;
  String? createdAt;
  String? updatedAt;

  StaffImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['image_url'];
    imageableId = json['imageable_id'];
    imageableType = json['imageable_type'];
    isProfile = json['is_profile'];
    isCover = json['is_cover'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['image_url'] = imageUrl;
    _data['imageable_id'] = imageableId;
    _data['imageable_type'] = imageableType;
    _data['is_profile'] = isProfile;
    _data['is_cover'] = isCover;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
