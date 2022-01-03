import 'package:flutter/material.dart';
import 'package:iraskel_mobile/components/molecules/carouselitem.dart';
import 'package:iraskel_mobile/components/organisms/getstartedtemp.dart';
import 'package:iraskel_mobile/localizations/app_localizations.dart';

class GetStarted extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CarouselSliderWidget();
  }

  const GetStarted({Key? key}) : super(key: key);
}

class CarouselSliderWidget extends State<GetStarted> {
  //final List<Widget> pages =
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// appBar: AppBar(title: Text('Fullscreen sliding carousel demo')),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return GStartTemplate(
            orientation: orientation,
            pages: [
              CarouselItem(
                imageSrcItem: 'assets/getstarted/start.png',
                h2TextItem: '${LocalizationHelper.of(context)!.t_start}',
                descriptionTextItem:
                    '${LocalizationHelper.of(context)!.t_startText}',
                orientation: orientation,
              ),
              CarouselItem(
                imageSrcItem: 'assets/getstarted/participate.png',
                h2TextItem: '${LocalizationHelper.of(context)!.t_participate}',
                descriptionTextItem:
                    '${LocalizationHelper.of(context)!.t_participateText}',
                orientation: orientation,
              ),
              CarouselItem(
                imageSrcItem: 'assets/getstarted/communicate.png',
                h2TextItem: '${LocalizationHelper.of(context)!.t_communicate}',
                descriptionTextItem:
                    '${LocalizationHelper.of(context)!.t_communicateText}',
                orientation: orientation,
              ),
              CarouselItem(
                imageSrcItem: 'assets/getstarted/win.png',
                h2TextItem: '${LocalizationHelper.of(context)!.t_win}',
                descriptionTextItem:
                    '${LocalizationHelper.of(context)!.t_winText}',
                orientation: orientation,
              ),
              CarouselItem(
                imageSrcItem: 'assets/getstarted/join.png',
                h2TextItem: '${LocalizationHelper.of(context)!.t_join}',
                descriptionTextItem:
                    '${LocalizationHelper.of(context)!.t_joinText}',
                orientation: orientation,
              ),
            ],
          );
        },
      ),
    );
  }
}
