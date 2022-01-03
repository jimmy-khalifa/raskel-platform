import 'package:flutter/material.dart';
import 'package:iraskel_mobile/components/atoms/_startimage.dart';
import 'package:iraskel_mobile/components/atoms/h2.dart';
import 'package:iraskel_mobile/components/atoms/startdescription.dart';

class CarouselItem extends StatelessWidget {
  final String imageSrcItem, h2TextItem, descriptionTextItem;
  final orientation;

  const CarouselItem(
      {Key? key,
      required this.imageSrcItem,
      required this.h2TextItem,
      required this.descriptionTextItem,
      required this.orientation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (context, orientation) {
        return orientation == Orientation.portrait
            ? Center(
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
              )
            : Center(
                child: InkWell(
                  splashColor: Colors.blue.withAlpha(30),
                  onTap: () {},
                  child: Expanded(
                    //width: MediaQuery.of(context).size.width - 10,
                    //height: MediaQuery.of(context).size.height - 10,

                    child: Row(
                      children: [
                        StartImage(imageSrcItem, BoxFit.scaleDown),
                        Expanded(
                          child: Column(
                            children: [
                              H2Text(h2text: h2TextItem),
                              StartDescription(
                                descriptionText: descriptionTextItem,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
      },
    );
  }
}
