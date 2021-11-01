import 'package:flutter/material.dart';

import 'package:animated_text_kit/animated_text_kit.dart';
import '_mapview.dart';

class WaitView extends StatelessWidget {
  const WaitView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme:const IconThemeData(color: Colors.black),
        ),
        body:  Column(
          children: [
            const Text("عملية الجمع القادمة",
                style: TextStyle(fontSize: 30, color: Colors.black)),
            const Text("14:15:30",
                style: TextStyle(fontSize: 30, color: Colors.black)),
            Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 4)),
            SizedBox(
                width: MediaQuery.of(context).size.width / 1.2,
                height: MediaQuery.of(context).size.height / 5,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.black87,
                    border: Border.all(
                        color: Colors.grey,
                        width: 6.0,
                        style: BorderStyle.solid), //Border.all

                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0),
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0),
                    ),
                  ),
                  child: Center(
                    child: DefaultTextStyle(
                      style:
                          const TextStyle(fontSize: 18.0, color: Colors.green),
                      child: AnimatedTextKit(
                        pause:const Duration(milliseconds: 300),
                        repeatForever: true,
                        animatedTexts: [
                          FadeAnimatedText('تنبيه'),
                          FadeAnimatedText(
                              'عليكم إخراج كيس القمامة قبل خمس عشرة دقيقة'),
                          FadeAnimatedText('من وصول شاحنة جمع النفايات'),
                          FadeAnimatedText('نرجو التثبت عند إخراج كيس القمامة'),
                          FadeAnimatedText('من وضعه في مكان بعيد عن الطريق'),
                          FadeAnimatedText('عند عدم وجود كيس القمامة'),
                          FadeAnimatedText('تواصل الشاحنة تقدمها'),
                        ],
                      ),
                    ),
                  ),
                )),
            Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 6)),
            Align(
                alignment: FractionalOffset.bottomCenter,
                child: ElevatedButton(
                  style:ElevatedButton.styleFrom(
                    primary:Colors.black,
                    shape:const CircleBorder(),
                  padding:const EdgeInsets.all(40),
                  ),
                                


                  
                  
                  onPressed: () {
                     Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>const MapView()));
                  },
                  child:const Text('تأكيد',
                      style: (TextStyle(
                        fontSize: 20,
                      ))),
                ))
          ],
        ));
  }
}