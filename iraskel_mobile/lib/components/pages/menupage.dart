

import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iraskel_mobile/components/atoms/_text.dart';
import 'package:iraskel_mobile/components/molecules/_profilewidget.dart';
import 'package:iraskel_mobile/components/pages/signin.dart';
import 'package:iraskel_mobile/components/templates/accountform.dart';
import 'package:iraskel_mobile/components/templates/addressform.dart';
import 'package:iraskel_mobile/components/templates/bacform.dart';
import 'package:iraskel_mobile/components/templates/propertiesform.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  late Future<String?> username;
  late Future<String?> lastname;
  late Future<String?> firstname;
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  @override
  // ignore: must_call_super
  void initState() {
    username = _prefs.then((SharedPreferences prefs) {
      return prefs.getString('username');
    });
    lastname = _prefs.then((SharedPreferences prefs) {
      return prefs.getString('lastname');
    });
    firstname = _prefs.then((SharedPreferences prefs) {
      return prefs.getString('firstname');
    });
  }



  @override
  Widget build(BuildContext context) {
    return Card(
        child: FutureBuilder<String?>(
            future: username,
            builder: (BuildContext context, AsyncSnapshot<String?> user) {
              return FutureBuilder<String?>(
                  future: lastname,
                  builder: (BuildContext context, AsyncSnapshot<String?> last) {
                    return FutureBuilder<String?>(
                        future: firstname,
                        builder: (BuildContext context,
                            AsyncSnapshot<String?> first) {
                          return ListView(
                            children: <Widget>[
                              ProfileWidget('assets/images/profile.png',
                                  user.data ?? ' ', 30.0),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomText(
                                        last.data ?? '', FontWeight.w400, 25.0),
                                    Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                40)),
                                    CustomText(first.data ?? '',
                                        FontWeight.w400, 25.0),
                                  ]),
                              const Divider(color: Color(0xFFDFF4EC)),
                              buildMenuItem(
                                text: "Compte",
                                icon: FeatherIcons.user,
                                onClicked: () => selectedItem(context, 0),
                              ),
                              const Divider(color: Color(0xFFDFF4EC)),
                              buildMenuItem(
                                text: 'Adresse',
                                icon: FeatherIcons.map,
                                onClicked: () => selectedItem(context, 1),
                              ),
                              const Divider(color: Color(0xFFDFF4EC)),
                              buildMenuItem(
                                text: 'Proprietés',
                                icon: FeatherIcons.home,
                                onClicked: () => selectedItem(context, 2),
                              ),
                              const Divider(color: Color(0xFFDFF4EC)),
                              buildMenuItem(
                                text: 'Bac',
                                icon: FeatherIcons.trash,
                                onClicked: () => selectedItem(context, 3),
                              ),
                              const Divider(color: Color(0xFFDFF4EC)),
                              buildMenuItem(
                                text: 'Factures',
                                icon: FeatherIcons.dollarSign,
                                onClicked: () {},
                              ),
                              const Divider(color: Color(0xFFDFF4EC)),
                              buildMenuItem(
                                text: 'Paramètres',
                                icon: FeatherIcons.settings,
                                onClicked: () {},
                              ),
                              const Divider(color: Color(0xFFDFF4EC)),
                              buildMenuItem(
                                text: 'Déconnexion',
                                icon: FeatherIcons.logOut,
                                onClicked: () => selectedItem(context, 4),
                              ),
                              const Divider(color: Color(0xFFDFF4EC)),
                            ],
                          );
                        });
                  });
            }));
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    const color = Color(0xFF65C88D);
    const hoverColor = Colors.black12;

    return ListTile(
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(
        text,
        style: GoogleFonts.tajawal(
            textStyle:
                const TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
      ),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  Future<void> selectedItem(BuildContext context, int index) async {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const AccountForm(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const AddressForm(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const PropertiesForm(),
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const BacForm(),
        ));
        break;
      case 4:
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.remove('token');
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext ctx) => const SignIn()));
    }
  }
}
  /* RaisedButton(
          onPressed: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.remove('token');
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (BuildContext ctx) => const SignIn()));
          },
          child: const Text('Logout'),
        );*/