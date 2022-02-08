import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:iraskel_mobile/components/atoms/menuitem.dart';
import 'package:iraskel_mobile/components/molecules/_profilewidget.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView(
        children: <Widget>[
           const ProfileWidget('assets/images/profile.png','Foulen Foulani'),
          const Padding(
            padding: EdgeInsets.only(top: 40),
          ),
          Column(
            children: [
              MenuItem(
                  icon: FeatherIcons.user, text: 'Compte', onClicked: () {}),
              const Divider(),
              MenuItem(
                  icon: FeatherIcons.home,
                  text: 'Propriétés',
                  onClicked: () {}),
              const Divider(),
              MenuItem(
                  icon: FeatherIcons.trash, text: 'Bacs', onClicked: () {}),
              const Divider(),
              MenuItem(
                  icon: FeatherIcons.dollarSign,
                  text: 'Facture',
                  onClicked: () {}),
              const Divider(),
              MenuItem(
                  icon: FeatherIcons.settings,
                  text: 'Paramètres',
                  onClicked: () {}),
              const Divider(),
            ],
          ),
        ],
      ),
    );
  }
}
