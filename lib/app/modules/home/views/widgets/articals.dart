import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/modules/home/views/widgets/articalCard.dart';

class ArticalsSection extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ArticalsSectionstate();
  }
}

class _ArticalsSectionstate extends State<ArticalsSection> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 700,
      color: generalColor,
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        SizedBox(
          height: 30,
        ),
        textWidget(
            stringText: 'المقالات',
            fontSize: 22,
            color: Colors.blueGrey[50],
            fontWeight: FontWeight.bold),
        Expanded(
          child: CarouselSlider(
            items: imageSliders,
            carouselController: _controller,
            options: CarouselOptions(
                height: 700,
                autoPlay: true,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {
                    _current = index;
                  });
                }),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: articalsTitle.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: (Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.white)
                        .withOpacity(_current == entry.key ? 1 : 0.4)),
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 20),
      ]),
    );
  }
}

final List<Widget> imageSliders = articalsImages
    .map((item) => CardWithImage(
          image: item,
          title: articalsTitle[articalsImages.indexOf(item)],
          content: articalsContent[articalsImages.indexOf(item)].substring
            (0,150)+''
              '.  .  . ',
        ))
    .toList();
