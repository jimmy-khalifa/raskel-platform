import 'package:flutter/material.dart';
import 'package:iraskel_mobile/components/molecules/carouselitem.dart';
import 'package:iraskel_mobile/components/organisms/getstartedtemp.dart';

final List<Widget> pages = [
  const CarouselItem(
      imageSrcItem: 'assets/getstarted/start.png',
      h2TextItem: 'Commencer',
      descriptionTextItem: 'Commencez dès maintenant à prendre soin de l'
          'environnement. Raskel vous guide pour mieux gèrer vos dèchets'),
  const CarouselItem(
      imageSrcItem: 'assets/getstarted/participate.png',
      h2TextItem: 'Participer',
      descriptionTextItem:
          'Participez par le trie de vos déchets dans les bacs désignés. Raskel vous permet de suivre le cycle de vie de vos déchets. '),
  const CarouselItem(
      imageSrcItem: 'assets/getstarted/communicate.png',
      h2TextItem: 'Communiquer',
      descriptionTextItem:
          'Communiquer avec  vos collecteurs et votre communité. Raskel vous permet de partager et communiquer avec les autres membres.'),
  const CarouselItem(
      imageSrcItem: 'assets/getstarted/win.png',
      h2TextItem: 'Gagner',
      descriptionTextItem:
          'Gagner des points et des cadeaux, pour votre participation au Triage des déchets. Raskel récompense votre participation'),
  const CarouselItem(
      imageSrcItem: 'assets/getstarted/join.png',
      h2TextItem: 'Joindre',
      descriptionTextItem: 'Rejoingez nous et une votre communité.'),
];

class GetStarted extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CarouselSliderWidget();
  }

  const GetStarted({Key? key}) : super(key: key);
}

class CarouselSliderWidget extends State<GetStarted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// appBar: AppBar(title: Text('Fullscreen sliding carousel demo')),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return GStartTemplate(
            orientation: orientation,
            pages: pages,
          );
        },
      ),
    );
  }
}
