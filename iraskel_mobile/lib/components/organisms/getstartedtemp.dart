// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:iraskel_mobile/components/atoms/corousel.dart' as global;
import 'package:iraskel_mobile/components/organisms/stepperbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:iraskel_mobile/localizations/app_localizations.dart';

final CarouselController controller = CarouselController();

class GStartTemplate extends StatefulWidget {
  final orientation, pages;

  const GStartTemplate({Key? key, this.orientation, this.pages})
      : super(key: key);

  @override
  GStartTemplateState createState() => GStartTemplateState();
}

class GStartTemplateState extends State<GStartTemplate> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  setSelectedIndex(value) {
    setState(() {
      selectedIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: widget.orientation == Orientation.portrait
            ? EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 20,
                left: MediaQuery.of(context).size.width / 25,
                right: MediaQuery.of(context).size.width / 25,
                bottom: MediaQuery.of(context).size.height / 45)
            : EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 20,
                left: MediaQuery.of(context).size.width / 25,
                right: MediaQuery.of(context).size.width / 25,
                bottom: MediaQuery.of(context).size.height / 45),
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(children: [
          global.AppCarouselSlider(
            orientation: widget.orientation,
            setter: setSelectedIndex,
            controller: controller,
            pages: widget.pages,
          ),
          StepperBar(
            buttonText: '${LocalizationHelper.of(context)!.t_skip}',
            horizPadding: 15,
            pagesLength: widget.pages.length,
            controller: controller,
            selectedIndex: selectedIndex,
            setter: setSelectedIndex,
          ),
        ]));
  }
}
