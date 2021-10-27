import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SelectView extends StatefulWidget {
  const SelectView({Key? key}) : super(key: key);

  @override
  _SelectViewState createState() => _SelectViewState();
}

class _SelectViewState extends State<SelectView> {
  final TextEditingController _textEditingController = TextEditingController();
  var inputText = "";

  List<String> garbageList = [
    'Homogène',
    'Biomasse',
    'Plastique',
    'Papier',
    'Couche',
    'Batterie',
    'Electronique',
    'Bois',
    'Huile',
    'Tissue',
    'Verre',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: 
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width / 1,
              padding: const EdgeInsets.only(top: 30),
              child: ListTile(
                title: TextField(
                  //selectionHeightStyle: BoxHeightStyle.max,
                  controller: _textEditingController,
                  onChanged: (text) {
                    setState(() {
                      inputText = text;
                    });
                  },
                  decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Color(0xFF393E41),
                        size: 25,
                      ),
                      suffixIcon: hidingIcon(),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFFDFF4EC))),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF79D1B4))),
                      hintText: 'Recherche',
                      border: InputBorder.none),
                ),
                trailing: ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    "Annuler",
                  ),
                ),
              ),
            ),
            Expanded(
                child: ListView.separated(
              itemCount: garbageList.length,
              itemBuilder: (context, index) {
                return Container(
                    padding:const EdgeInsets.all(10.0),
                    child: Row(
                      children: [
                        //Padding(padding: EdgeInsets.all(18)),
                        const Icon(
                          Icons.add_alert,
                          color: Color(0xDE393E41),
                          size: 30,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(garbageList[index],
                            style: GoogleFonts.tajawal(
                                textStyle:const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w300,
                                    color: Color(0xDE393E41)))),
                      ],
                    ));
              },
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(
                indent: 20,
                color: Color(0xFFDFF4EC),
              ),
            )),
          ],
        ));
  }

  hidingIcon() {
    if (inputText.isNotEmpty) {
      return IconButton(
          icon:const Icon(
            Icons.clear,
            color: Color(0xFF393E41),
          ),
          onPressed: () {
            setState(() {
              _textEditingController.clear();
              inputText = "";
            });
          });
    } else {
      return null;
    }
  }
}
