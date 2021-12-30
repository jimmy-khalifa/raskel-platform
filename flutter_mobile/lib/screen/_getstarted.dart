import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobile/components/getstarted/_gscommunicate.dart';
import 'package:flutter_mobile/components/getstarted/_gsjoin.dart';
import 'package:flutter_mobile/components/getstarted/_gsparticipate.dart';
import 'package:flutter_mobile/components/getstarted/_gsstart.dart';
import 'package:flutter_mobile/components/getstarted/_gswin.dart';
import 'package:flutter_mobile/screen/_singin.dart';
import 'package:google_fonts/google_fonts.dart';

final List<Widget> pages = [
  const StartWidget(),
  const ParticipateWidget(),
  const CommunicateWidget(),
  const WinWidget(),
  const JoinWidget()
];

int _selectedIndex = 0;

class GetStarted extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CarouselSliderWidget();
  }

  const GetStarted({Key? key}) : super(key: key);
}

class CarouselSliderWidget extends State<GetStarted> {
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// appBar: AppBar(title: Text('Fullscreen sliding carousel demo')),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Card(
              margin: orientation == Orientation.portrait
                  ? EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 20,
                      left: MediaQuery.of(context).size.width / 25,
                      right: MediaQuery.of(context).size.width / 25,
                      bottom: MediaQuery.of(context).size.height / 45)
                  : EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 20,
                      left: MediaQuery.of(context).size.width / 2.5,
                      right: MediaQuery.of(context).size.width / 2.5,
                      bottom: MediaQuery.of(context).size.height / 45),
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Column(children: [
                Expanded(
                    flex: orientation == Orientation.portrait ? 4 : 6,
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: MediaQuery.of(context).size.height,
                        viewportFraction: 1.0,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        onPageChanged: (pageIndex, reason) => {
                          if (reason != CarouselPageChangedReason.controller)
                            setState(() {
                              _selectedIndex = pageIndex;
                            }),
                        },
                      ),
                      carouselController: _controller,
                      items: pages
                          .map((item) => Container(
                                margin: const EdgeInsets.all(0),
                                child: Center(child: item),
                              ))
                          .toList(),
                    )),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(5),
                    height: 1,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ...Iterable<int>.generate(pages.length).map(
                              (int pageIndex) => Flexible(
                                child: ElevatedButton(
                                    onPressed: () => {
                                          _controller.animateToPage(pageIndex),
                                          setState(() {
                                            _selectedIndex = pageIndex;
                                          }),
                                        },
                                    child: const Text(""),
                                    style: ElevatedButton.styleFrom(
                                      shape: const CircleBorder(),
                                      fixedSize: const Size(10, 10),
                                      maximumSize: const Size(12, 12),
                                      minimumSize: const Size(8, 8),
                                      shadowColor: const Color(0X00FFFFFF),
                                      primary: _selectedIndex == pageIndex
                                          ? const Color(0xFF65C88D)
                                          : const Color(0x5565C88D),
                                      visualDensity: const VisualDensity(
                                          horizontal:
                                              VisualDensity.minimumDensity,
                                          vertical:
                                              VisualDensity.minimumDensity),
                                    )),
                              ),
                            )
                          ],
                        ),
                        Center(
                            child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                vertical:
                                    MediaQuery.of(context).size.height / 80,
                                horizontal:
                                    MediaQuery.of(context).size.width / 15),
                            backgroundColor: Colors.white,
                            side: const BorderSide(color: Color(0xFF65C88D)),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignIn()),
                            );
                          },
                          child: Text(
                            'Passer',
                            style: GoogleFonts.tajawal(
                                textStyle: const TextStyle(
                              color: Color(0xFF65C88D),
                              fontWeight: FontWeight.w400,
                              fontSize: 20.0,
                            )),
                          ),
                        )),
                      ],
                    ),
                  ),
                ),
              ]));
        },
      ),
    );
  }
}
