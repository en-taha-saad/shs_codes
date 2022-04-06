class Setting {
  Setting({
    required this.id,
    required this.settingableId,
    required this.settingableType,
    required this.showEmail,
    required this.showPhone,
    required this.showMessages,
    required this.showRecommendations,
    required this.showRatings,
  });
  late final int id;
  late final int settingableId;
  late final String settingableType;
  late final int showEmail;
  late final int showPhone;
  late final int showMessages;
  late final int showRecommendations;
  late final int showRatings;

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
