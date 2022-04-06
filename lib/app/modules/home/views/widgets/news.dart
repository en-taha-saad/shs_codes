import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:shs108private/app/global/strings/global_string.dart';
import 'package:shs108private/app/global/widgets/text_widget.dart';
import 'package:shs108private/app/modules/home/views/widgets/articalCard.dart';

class NewsSection extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NewsSectionstate();
  }
}

class _NewsSectionstate extends State<NewsSection> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 700,
      child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        SizedBox(
          height: 30,
        ),
        textWidget(
            stringText: 'أحدث الأخبار',
            fontSize: 22,
            color: generalColor,
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
          children: newsImages.asMap().entries.map((entry) {
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
                            : generalColor)
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

final List<Widget> imageSliders = newsImages
    .map((item) => CardWithImage(
          image: item,
          title: newsTitles[newsImages.indexOf(item)],
          content: newsContent[newsImages.indexOf(item)].substring(0, 100) +
              ''
                  '.  .  . ',
        ))
    .toList();
