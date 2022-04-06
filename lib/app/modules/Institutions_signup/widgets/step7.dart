import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shs108private/app/modules/Institutions_signup/controllers/institutions_signup_controller.dart';
// import 'package:shs108private/app/modules/signup/controllers/signup_controller.dart';
// import 'package:shs108private/app/modules/signup/widgets/add_card_widget.dart';
// import 'package:shs108private/app/modules/signup/widgets/show_list_widget.dart';

class Step7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            GetBuilder(
              builder: (InstitutionsSignupController c) {
                return Column(
                  children: [
                    ...c.listOfPrefCheckboxes.map(c.settingsCheckboxes)
                        .toList(),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
