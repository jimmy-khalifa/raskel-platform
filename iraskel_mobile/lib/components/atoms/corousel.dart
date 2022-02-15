import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class AppCarouselSlider extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final orientation;
  final Function setter;
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  // ignore: prefer_typing_uninitialized_variables
  final pages;

  const AppCarouselSlider(
      {Key? key,
      this.orientation,
      required this.setter,
      this.controller,
      this.pages})
      : super(key: key);

  @override
  _AppCarouselSliderState createState() => _AppCarouselSliderState();
}

class _AppCarouselSliderState extends State<AppCarouselSlider> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: widget.orientation == Orientation.portrait ? 4 : 2,
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
          items: widget.pages
              .map<Widget>((item) => Container(
                    margin: const EdgeInsets.all(0),
                    child: Center(child: item),
                  ))
              .toList(),
        ));
  }
}
