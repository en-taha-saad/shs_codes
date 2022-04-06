// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';

class DrugSearchBar extends StatefulWidget {
  final Callback? onPressed;
  const DrugSearchBar({Key? key, this.onPressed}) : super(key: key);

  @override
  _DrugSearchBarState createState() => _DrugSearchBarState();
}

TextEditingController searchText = TextEditingController();

class _DrugSearchBarState extends State<DrugSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.all(20),
      child: Row(
        children: <Widget>[
          Expanded(
            child: FormBuilderTextField(
              controller: searchText,
              decoration: InputDecoration(
                labelText: "بحث عن ادوية..",
                labelStyle: style(fontSize: 12),
                suffixIcon: Container(
                  width: MediaQuery.of(context).size.width / 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.search,
                          color: generalColor,
                        ),
                        onPressed: widget.onPressed,
                      ),
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
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              onChanged: (String? selected) => widget.onPressed!.call(),
              // onSubmitted: (String? selected)=>widget.onPressed!.call(),
              name: 'searchDrug_by_name',
            ),
          ),
          // SizedBox(width: 15),
          // Container(
          //   decoration: BoxDecoration(
          //       color: Colors.white,
          //       borderRadius: BorderRadius.circular(9.0),
          //       border: Border.all(color: Colors.grey)
          //   ),
          //   child: IconButton(
          //     icon: Icon(
          //       Icons.camera_alt_outlined,
          //       color: generalColor,
          //     ),
          //     onPressed: () {},
          //   ),
          // ),
          // SizedBox(width: 15),
          // Container(
          //   decoration: BoxDecoration(
          //       color: Colors.white,
          //       borderRadius: BorderRadius.circular(9.0),
          //       border: Border.all(color: Colors.grey)
          //   ),
          //   child: IconButton(
          //     icon: Icon(
          //       Icons.photo,
          //       color: generalColor,
          //     ),
          //     onPressed: () {},
          //   ),
          // ),
        ],
      ),
    );
  }

  // final _picker = ImagePicker();
  //
  // Future<void> pickImageFromGallery() async {
  //   final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
  //   if (pickedFile != null) {
  //     setState(() {
  //       pickedFileString = pickedFile.path;
  //       imageFile = File(pickedFile.path);
  //     });
  //   }
  // }
  //
  // Future<void> pickImageFromCamera() async {
  //   final pickedFile = await _picker.pickImage(source: ImageSource.camera);
  //   if (pickedFile != null) {
  //     setState(() {
  //       pickedFileString = pickedFile.path;
  //       imageFile = File(pickedFile.path);
  //     });
  //   }
  // }
}
