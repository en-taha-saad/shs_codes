// class GetDataModel {
//   int? id;
//   String? name;
//   String? other = '';
//   bool? selectedOther;
//   GetDataModel({
//     this.id,
//     this.name,
//     this.other,
//     this.selectedOther,
//   });
//   factory GetDataModel.fromJson(Map<String, dynamic>? json) {
//     return GetDataModel(
//       id: json?['id'],
//       name: json?['name'].toString().trim(),
//       other: json?['other'],
//       selectedOther: json?['selected_other'],
//     );
//   }
//   Map<String, dynamic>? toJson() {
//     return {
//       'id': id,
//       'name': name,
//       'other': other,
//       'selected_other': selectedOther,
//     };
//   }
//   Map<String, dynamic>? toJsonPost() {
//     if (other != null) {
//       return {
//         'other': other,
//       };
//     }
//     return {
//       'id': id,
//     };
//   }
//   static List<GetDataModel> fromJsonList(List list) =>
//       list.map((item) => GetDataModel.fromJson(item)).toList();
//   ///this method will prevent the override of toString
//   String userAsString() => '#$id $name';
//   ///custom comparing function to check if two users are equal
//   bool isEqual(GetDataModel? model) => id == model?.id;
//   // @override
//   // String toString() => name;
//   // ignore: override_on_non_overriding_member
//   // int? toInt() => id;
// }

class GetDataModel {
  final int? id;
  final String name;
  String? other = '';
  bool? selectedOther;

  GetDataModel({
    this.id,
    required this.name,
    this.other,
    this.selectedOther,
  });

  factory GetDataModel.fromJson(Map<String, dynamic>? json) {
    return GetDataModel(
      id: json?["id"],
      name: json?["name"],
      other: json?['other'],
      selectedOther: json?['selected_other'],
    );
  }
  Map<String, dynamic>? toJson() {
    return {
      'id': id,
      'name': name,
      'other': other,
      'selected_other': selectedOther,
    };
  }

  Map<String, dynamic>? toJsonPost() {
    if (other != null) {
      return {
        'other': other,
      };
    }
    return {
      'id': id,
    };
  }

  static List<GetDataModel> fromJsonList(List list) =>
      list.map((item) => GetDataModel.fromJson(item)).toList();

  ///this method will prevent the override of toString
  String userAsString() => '#$id $name';

  ///custom comparing function to check if two users are equal
  bool isEqual(GetDataModel? model) => id == model?.id;

  @override
  String toString() => name;
  int? toInt() => id;
}

class CountryModel {
  int? id;
  String? name;

  CountryModel({
    this.id,
    this.name,
  });

  factory CountryModel.fromJson(Map<String, dynamic>? json) {
    return CountryModel(
      id: json?['id'],
      name: json?['name'],
    );
  }

  Map<String, dynamic>? toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  static List<CountryModel> fromJsonList(List list) =>
      list.map((item) => CountryModel.fromJson(item)).toList();
}

// class GetDataModel1 {
//   String? name;
//   int? id;
//   GetDataModel1({
//     this.name,
//     this.id,
//   });
//   static GetDataModel1? fromMap(Map<String, dynamic>? map) {
//     if (map == null) {
//       return null;
//     }
//     return GetDataModel1(
//       name: map['name'],
//       id: map['id'],
//     );
//   }
//   static GetDataModel1? fromJson(String source) => fromMap(json.decode(source));
// }
