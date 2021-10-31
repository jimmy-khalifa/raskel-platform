// ignore_for_file: unnecessary_new

import 'package:flutter/material.dart';

class SelectView extends StatefulWidget {
  const SelectView({Key? key}) : super(key: key);

  @override
  _SelectViewState createState() => _SelectViewState();
}

class _SelectViewState extends State<SelectView> {
  final TextEditingController _textEditingController = TextEditingController();
  var inputText = "";

  List garbageList = [
    {"name": 'Homogène', "icon": "assets/images/homogene.png"},
    {"name": 'Biomasse', 'icon': 'assets/images/chiken.png'},
    {'name': 'Plastique', 'icon': 'assets/images/soda.png'},
    {'name': 'Papier', 'icon': 'assets/images/package.png'},
    {'name': 'Couche', 'icon': 'assets/images/couche.png'},
    {'name': 'Batterie', 'icon': 'assets/images/battery.png'},
    {'name': 'Electronique', 'icon': 'assets/images/tv.png'},
    {'name': 'Bois', 'icon': 'assets/images/chaire.png'},
    {'name': 'Huile', 'icon': 'assets/images/oil.png'},
    {'name': 'Tissue', 'icon': 'assets/images/clothes.png'},
    {'name': 'Verre', 'icon': 'assets/images/bottle.png'}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width / 1,
              padding:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 15),
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
                trailing: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Annuler",
                    style: TextStyle(color: Color(0xFF79D1B4), fontSize: 18),
                  ),
                ),
              ),
            ),
            Expanded(
                child: ListView.separated(
              itemCount: garbageList.length,
              itemBuilder: (context, index) {
                return

                    /*Container(
                    padding:
                        EdgeInsets.all(MediaQuery.of(context).size.height / 35),
                    child: Row(
                      children: [
                        //Padding(padding: EdgeInsets.all(18)),
                       
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 15,
                        ),
                        Text(garbageList[index],
                            style: GoogleFonts.tajawal(
                                textStyle: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w300,
                                    color: Color(0xDE393E41)))),
                      ],
                    ));*/
                    UserWidget(
                  name: garbageList[index]['name'],
                   imageURL: garbageList[index]['icon'],
                );
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
          icon: const Icon(
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

class UserWidget extends StatelessWidget {
  final String name;
    final String imageURL;

  const UserWidget({
    Key? key,
    required this.name,
    required this.imageURL
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.symmetric(vertical: 1.0),
      child: new ListTile(
        leading:  Image.asset(imageURL,height: MediaQuery.of(context).size.height / 30,),
        
        title: new Text(name),
      ),
    );
  }
}
