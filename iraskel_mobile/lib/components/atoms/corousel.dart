import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:iraskel_mobile/components/pages/_getstarted.dart';

class AppCarouselSlider extends StatefulWidget {
  final orientation;
  final Function setter;
  final controller;

  const AppCarouselSlider(
      {Key? key, this.orientation, required this.setter, this.controller})
      : super(key: key);

  @override
  _AppCarouselSliderState createState() => _AppCarouselSliderState();
}

class _AppCarouselSliderState extends State<AppCarouselSlider> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: widget.orientation == Orientation.portrait ? 4 : 6,
        child: CarouselSlider(
          options: CarouselOptions(
            height: MediaQuery.of(context).size.height,
            viewportFraction: 1.0,
            enlargeCenterPage: true,
            autoPlay: true,
            onPageChanged: (pageIndex, reason) => {
              if (reason != CarouselPageChangedReason.controller)
                setState(() {
                  widget.setter(pageIndex);
                }),
            },
          ),
          carouselController: widget.controller,
          items: pages
              .map<Widget>((item) => Container(
                    margin: const EdgeInsets.all(0),
                    child: Center(child: item),
                  ))
              .toList(),
        ));
  }
}
