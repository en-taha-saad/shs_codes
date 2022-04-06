// import 'package:flutter/material.dart';
// import 'package:shs108private/app/global/widgets/text_widget.dart';

// class Step29 extends StatefulWidget {
//   Step29({Key? key}) : super(key: key);

//   @override
//   _Step29State createState() => _Step29State();
// }

// class _Step29State extends State<Step29> {
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           Container(
//             margin: EdgeInsets.only(bottom: 10),
//             child: Center(
//               child: textWidget(
//                 stringText: 'قائمة المؤسسات الصحية العاملة',
//                 fontSize: 20,
//               ),
//             ),
//           ),
//           Container(
//             height: 300,
//             child: ListView(
//               scrollDirection: Axis.horizontal,
//               children: <Widget>[
//                 DataTable(
//                   columnSpacing: 20,
//                   dataRowHeight: 70,
//                   checkboxHorizontalMargin: 20,
//                   decoration: BoxDecoration(
//                     border: Border.all(color: Colors.black),
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   dataRowColor: MaterialStateProperty.all(
//                     Colors.grey.shade100,
//                   ),
//                   headingRowHeight: 80,
//                   horizontalMargin: 30,
//                   columns: [
//                     DataColumn(
//                       label: textWidget(
//                         stringText: 'نوع المؤسسة الصحية',
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     DataColumn(
//                       label: textWidget(
//                         stringText: "اسم المؤسسة الصحية",
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     DataColumn(
//                       label: textWidget(
//                         stringText: 'القسم',
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     DataColumn(
//                       label: textWidget(
//                         stringText: 'الحالة',
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     DataColumn(
//                       label: textWidget(
//                         stringText: 'اظهار ضمن الصفحة الشخصية',
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     DataColumn(
//                       label: textWidget(
//                         stringText: 'تعديل',
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                   rows: [
//                     // DataRow(
//                     //   cells: [
//                     //     DataCell(
//                     //       textWidget(
//                     //         stringText: 'عيادة خاصه',
//                     //         fontSize: 17,
//                     //       ),
//                     //     ),
//                     //     DataCell(
//                     //       textWidget(
//                     //         stringText: 'عيادة الدكتور محمد احمد العراقي',
//                     //         fontSize: 17,
//                     //       ),
//                     //     ),
//                     //     DataCell(textWidget(stringText: '')),
//                     //     DataCell(
//                     //       textWidget(
//                     //         stringText: 'دوام مسائي',
//                     //         fontSize: 17,
//                     //       ),
//                     //     ),
//                     //     DataCell(
//                     //       textWidget(
//                     //         stringText: 'نعم',
//                     //         fontSize: 17,
//                     //       ),
//                     //     ),
//                     //     DataCell(
//                     //       textWidget(
//                     //         stringText: 'انسحاب',
//                     //         fontSize: 17,
//                     //       ),
//                     //     ),
//                     //   ],
//                     // ),
//                     // DataRow(
//                     //   cells: [
//                     //     DataCell(
//                     //       textWidget(
//                     //         stringText: 'مستشفى خاص',
//                     //         fontSize: 17,
//                     //       ),
//                     //     ),
//                     //     DataCell(
//                     //       textWidget(
//                     //         stringText: 'مستشفى الامل التخصصي',
//                     //         fontSize: 17,
//                     //       ),
//                     //     ),
//                     //     DataCell(
//                     //       textWidget(
//                     //         stringText: 'قسم الكسور',
//                     //         fontSize: 17,
//                     //       ),
//                     //     ),
//                     //     DataCell(
//                     //       textWidget(
//                     //         stringText: 'طلب الاضافة',
//                     //         fontSize: 17,
//                     //       ),
//                     //     ),
//                     //     DataCell(
//                     //       textWidget(
//                     //         stringText: '',
//                     //         fontSize: 17,
//                     //       ),
//                     //     ),
//                     //     DataCell(
//                     //       textWidget(
//                     //         stringText: 'موافقة\nرفض',
//                     //         fontSize: 17,
//                     //       ),
//                     //     ),
//                     //   ],
//                     // ),
//                     // DataRow(
//                     //   cells: [
//                     //     DataCell(
//                     //       textWidget(
//                     //         stringText: 'مستشفى خاص',
//                     //         fontSize: 17,
//                     //       ),
//                     //     ),
//                     //     DataCell(
//                     //       textWidget(
//                     //         stringText: 'مستشفى العراق',
//                     //         fontSize: 17,
//                     //       ),
//                     //     ),
//                     //     DataCell(
//                     //       textWidget(
//                     //         stringText: 'قسم الكسور',
//                     //         fontSize: 17,
//                     //       ),
//                     //     ),
//                     //     DataCell(
//                     //       textWidget(
//                     //         stringText: 'عمليات عند الطلب',
//                     //         fontSize: 17,
//                     //       ),
//                     //     ),
//                     //     DataCell(
//                     //       textWidget(
//                     //         stringText: 'كلا',
//                     //         fontSize: 17,
//                     //       ),
//                     //     ),
//                     //     DataCell(
//                     //       textWidget(
//                     //         stringText: 'انسحاب',
//                     //         fontSize: 17,
//                     //       ),
//                     //     ),
//                     //   ],
//                     // ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
