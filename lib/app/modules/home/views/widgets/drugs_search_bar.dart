import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/routes/app_pages.dart';

class NewDrugsSearchBar extends StatefulWidget {
  @override
  State<NewDrugsSearchBar> createState() => _NewDrugsSearchBarState();
}

class _NewDrugsSearchBarState extends State<NewDrugsSearchBar> {
  List<DrugsSearch>? list = [];

  onfindSearchDrugs() async {
    await Dio()
        .get(
      "https://shs-iq.com/api/api/drugs",
      // queryParameters: {"filter": filter},
    )
        .then((value) {
      debugPrint('list = $list');
      debugPrint('value.data = ${value.data}');
      list = DrugsSearch.fromJsonList(value.data);
      setState(() {});
      debugPrint('11@@@list = $list');
      debugPrint('222@@@value.data = ${value.data}');
    }).onError((_, __) {
      return;
    });
  }

  @override
  void initState() {
    onfindSearchDrugs();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.only(bottom: 10, top: 10,left: 20,right: 20),
      child: Row(
        children: <Widget>[
          Expanded(
            child: DropdownSearch<DrugsSearch>(
              showSearchBox: true,
              mode: Mode.DIALOG,
              items: list,
              onChanged: (u) {
                Get.toNamed(Routes.DRUG_PROFILE, arguments: u);
              },
              itemAsString: (u) {
                return (u?.drugDescriptions?.map((e) {
                  return '${e.tradeName} ${e.genericName}';
                }).toString())!;
              },
              // ignore: prefer_is_empty
              onFind: list?.length == 0
                  ? (filter) async {
                      debugPrint('@@@@list = $list');
                      await Dio().get(
                        "https://shs-iq.com/api/api/drugs?search_text=$filter",
                        queryParameters: {"filter": filter},
                      ).then((value) {
                        debugPrint('list = $list');
                        debugPrint('value.data = ${value.data}');
                        list = DrugsSearch.fromJsonList(value.data);
                        setState(() {});
                        debugPrint('11@@@list = $list');
                        debugPrint('222@@@value.data = ${value.data}');
                      }).onError((_, __) {
                        return;
                      });
                      return list!;
                    }
                  : null,
              popupItemBuilder: (__, model, _) {
                return Column(
                  children: (model.drugDescriptions
                      ?.map((e) => ListTile(
                            contentPadding: EdgeInsets.only(
                              right: 20,
                              left: 20,
                              bottom: 10,
                            ),
                            trailing: CachedNetworkImage(
                              imageUrl: "$imageUrl/${e.image?.imageUrl}",
                              imageBuilder: (context, imageProvider) {
                                return Container(
                                  height: 50,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: CachedNetworkImageProvider(
                                        "$imageUrl/${e.image?.imageUrl}",
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                              placeholder: (context, url) {
                                return Container(
                                  height: 50,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        placeholderImageIMG,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                              errorWidget: (context, url, error) {
                                return Container(
                                  height: 50,
                                  width: 80,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        placeholderImageIMG,
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              },
                            ),
                            title: Directionality(
                              textDirection: TextDirection.rtl,
                              child: textWidget(
                                stringText: e.tradeName ?? '',
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                // textAlign: TextAlign.center,
                              ),
                            ),
                            subtitle: Directionality(
                              textDirection: TextDirection.rtl,
                              child: textWidget(
                                stringText: e.genericName ?? '',
                                fontSize: 11,
                                // textAlign: TextAlign.center,
                              ),
                            ),
                          ))
                      .toList())!,
                );
              },
              emptyBuilder: (_, item) {
                return Center(
                  child: textWidget(
                    stringText: "لا يوجد $item\n او يرجى الاتصال بالانترنت",
                    fontSize: 18,
                    textAlign: TextAlign.center,
                  ),
                );
              },
              dropdownBuilder: (__, model) {
                return Directionality(
                  textDirection: TextDirection.ltr,
                  child: Container(
                    child: Center(
                      child: textWidget(
                        stringText: 'البحث عن الادويه',
                        fontSize: 15,
                        color: Colors.black,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                );
              },
              searchFieldProps: TextFieldProps(
                textDirection: TextDirection.rtl,
                enableSuggestions: true,
                showCursor: true,
                textAlign: TextAlign.right,
                textAlignVertical: TextAlignVertical.center,
                textCapitalization: TextCapitalization.words,
                textInputAction: TextInputAction.search,
                // controller: searchText,
                style: style(fontSize: 15),
                toolbarOptions: ToolbarOptions(
                  copy: true,
                  cut: true,
                  paste: true,
                  selectAll: true,
                ),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                    gapPadding: 10,
                  ),
                  contentPadding: EdgeInsets.only(left: 240, right: 10),
                  hintText: "ابحث هنا",
                  hintStyle: style(fontSize: 15),
                  hintTextDirection: TextDirection.rtl,
                ),
              ),
              dropDownButton: Container(),
              dropdownSearchDecoration: InputDecoration(
                fillColor: Colors.white,
                suffixIcon: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      // IconButton(
                      //   icon: Icon(
                      //     Icons.search,
                      //     color: generalColor,
                      //   ),
                      //   onPressed: () {},
                      // ),
                      IconButton(
                        icon: Icon(
                          Icons.camera_alt_outlined,
                          color: generalColor,
                        ),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.photo,
                          color: generalColor,
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.auto,
                floatingLabelStyle: TextStyle(fontSize: 20),
                isDense: true,
                isCollapsed: true,
                contentPadding:
                    EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.black),
                  gapPadding: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DrugsSearch {
  int? id;
  String? mohCode;
  String? gs1Code;
  String? shsCode;
  List<DrugDescriptions>? drugDescriptions;

  DrugsSearch({
    this.id,
    this.mohCode,
    this.gs1Code,
    this.shsCode,
    this.drugDescriptions,
  });

  DrugsSearch.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    mohCode = json['moh_code'];
    gs1Code = json['gs1_code'];
    shsCode = json['shs_code'];
    if (json['drug_descriptions'] != null) {
      drugDescriptions = <DrugDescriptions>[];
      json['drug_descriptions'].forEach((v) {
        drugDescriptions?.add(DrugDescriptions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['moh_code'] = mohCode;
    data['gs1_code'] = gs1Code;
    data['shs_code'] = shsCode;
    if (drugDescriptions != null) {
      data['drug_descriptions'] =
          drugDescriptions?.map((v) => v.toJson()).toList();
    }
    return data;
  }

  static List<DrugsSearch> fromJsonList(List list) {
    return list.map((item) => DrugsSearch.fromJson(item)).toList();
  }

  ///custom comparing function to check if two users are equal
  bool isEqual(DrugsSearch? model) {
    return id == model?.id;
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
  String? origin;
  String? distributor;
  int? drugId;
  DrugImage? image;

  DrugDescriptions({
    this.id,
    this.languageCode,
    this.tradeName,
    this.strength,
    this.genericName,
    this.dosageForm,
    this.routeOfAdministration,
    this.packageSize,
    this.manufacturer,
    this.origin,
    this.distributor,
    this.drugId,
    this.image,
  });

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
    origin = json['origin'];
    distributor = json['distributor'];
    drugId = json['drug_id'];
    image = json['image'] != null ? DrugImage.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['language_code'] = languageCode;
    data['trade_name'] = tradeName;
    data['strength'] = strength;
    data['generic_name'] = genericName;
    data['dosage_form'] = dosageForm;
    data['route_of_administration'] = routeOfAdministration;
    data['package_size'] = packageSize;
    data['manufacturer'] = manufacturer;
    data['origin'] = origin;
    data['distributor'] = distributor;
    data['drug_id'] = drugId;
    if (image != null) {
      data['image'] = image?.toJson();
    }
    return data;
  }
}

class DrugImage {
  int? id;
  String? imageUrl;
  int? imageableId;
  String? imageableType;
  int? isProfile;

  DrugImage({
    this.id,
    this.imageUrl,
    this.imageableId,
    this.imageableType,
    this.isProfile,
  });

  DrugImage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    imageUrl = json['image_url'];
    imageableId = json['imageable_id'];
    imageableType = json['imageable_type'];
    isProfile = json['is_profile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image_url'] = imageUrl;
    data['imageable_id'] = imageableId;
    data['imageable_type'] = imageableType;
    data['is_profile'] = isProfile;
    return data;
  }
}
