// ignore_for_file: camel_case_types, file_names

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shs108private/app/global/strings/global_string.dart';

import 'newsBarCard.dart';

class newsBarSection extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _newsBarSectionstate();
  }
}

class _newsBarSectionstate extends State<newsBarSection> {
  int current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 150,
      child: Expanded(
        child: CarouselSlider(
          items: sliders,
          carouselController: _controller,
          options: CarouselOptions(
              height: 150,
              disableCenter: false,
              // enlargeStrategy: CenterPageEnlargeStrategy.height,
              autoPlay: true,
              enlargeCenterPage: false,
              aspectRatio: 2.0,
              viewportFraction: 0.5,
              onPageChanged: (index, reason) {
                setState(() {
                  current = index;
                });
              }),
        ),
      ),
    );
  }
}

List<String> items = [
  'وزارة الصحة تعلن عن أنطلاق الحملة الوطنية الموسعة للتلقيح ضد كوفيد 19 في العراق...',
  'وزارة الصحة تعلن عن أنطلاق الحملة الوطنية الموسعة للتلقيح ضد كوفيد 19 في العراق...',
  'وزارة الصحة تعلن عن أنطلاق الحملة الوطنية الموسعة للتلقيح ضد كوفيد 19 في العراق...',
  'وزارة الصحة تعلن عن أنطلاق الحملة الوطنية الموسعة للتلقيح ضد كوفيد 19 في العراق...',
];

final List<Widget> sliders = newsBarImages
    .map((item) => BarCard(
          image: item,
          title: items[newsBarImages.indexOf(item)],
        ))
    .toList();
