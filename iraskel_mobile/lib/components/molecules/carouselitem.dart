import 'package:flutter/material.dart';
import 'package:iraskel_mobile/components/atoms/_startimage.dart';
import 'package:iraskel_mobile/components/atoms/h2.dart';
import 'package:iraskel_mobile/components/atoms/startdescription.dart';

class CarouselItem extends StatelessWidget {
  final imageSrcItem, h2TextItem, descriptionTextItem;

  const CarouselItem(
      {Key? key, this.imageSrcItem, this.h2TextItem, this.descriptionTextItem})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        splashColor: Colors.blue.withAlpha(30),
        onTap: () {},
        child: SizedBox(
          width: MediaQuery.of(context).size.width - 10,
          height: MediaQuery.of(context).size.height - 10,
          child: Column(
            children: [
              // Container(
              //   margin: EdgeInsets.only(
              //       top: MediaQuery.of(context).size.height / 7 - 30),
              // ),
              StartImage(imageSrcItem, BoxFit.scaleDown),
              H2Text(h2text: h2TextItem),
              StartDescription(
                descriptionText: descriptionTextItem,
              )
            ],
          ),
        ),
      ),
    );
  }
}
