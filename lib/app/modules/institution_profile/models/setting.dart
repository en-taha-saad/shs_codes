class Setting {
  Setting({
    this.id,
    this.settingableId,
    this.settingableType,
    this.showEmail,
    this.showPhone,
    this.showMessages,
    this.showRecommendations,
    this.showRatings,
  });
  int? id;
  int? settingableId;
  String? settingableType;
  int? showEmail;
  int? showPhone;
  int? showMessages;
  int? showRecommendations;
  int? showRatings;

  Setting.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    settingableId = json['settingable_id'];
    settingableType = json['settingable_type'];
    showEmail = json['show_email'];
    showPhone = json['show_phone'];
    showMessages = json['show_messages'];
    showRecommendations = json['show_recommendations'];
    showRatings = json['show_ratings'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['settingable_id'] = settingableId;
    _data['settingable_type'] = settingableType;
    _data['show_email'] = showEmail;
    _data['show_phone'] = showPhone;
    _data['show_messages'] = showMessages;
    _data['show_recommendations'] = showRecommendations;
    _data['show_ratings'] = showRatings;
    return _data;
  }
}
