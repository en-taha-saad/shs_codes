import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/routes/app_pages.dart';

Widget searchBar() {
  final _formKey = GlobalKey<FormBuilderState>();
  return Container(
    margin: EdgeInsets.all(20),
    height: 50,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        textWidget(
            stringText: "بحث بالاسم",
            color: generalColor,
            fontWeight: FontWeight.bold),
        SizedBox(width: 15),
        Expanded(
          child: FormBuilderTextField(
            decoration: InputDecoration(
              labelText: "البحث عن مقدمين الخدمات",
              labelStyle: style(fontSize: 12),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.search,
                  color: generalColor,
                ),
                onPressed: () {
                  Get.toNamed(
                    Routes.SEARCH_RESULTS,
                    arguments:
                        _formKey.currentState!.fields['search_by_name']!.value,
                  );
                },
              ),
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            validator: (val) {},
            name: 'searchDrug_by_name',
          ),
        ),
      ],
    ),
  );
}
