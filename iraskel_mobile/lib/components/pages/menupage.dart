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
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:iraskel_mobile/localizations/app_localizations.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  late String username ="";
  late String lastname ="";
  late String firstname="";

  void initHiveState() async {
    late final Box box = Hive.box('auth');
    username = box.get('username');
    lastname = box.get('lastname');
    firstname = box.get('firstname');
  }

  @override
  // ignore: must_call_super
  void initState() {
    initHiveState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListView(
      children: <Widget>[
        ProfileWidget('assets/images/profile.png', username, 30.0),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomText(firstname, FontWeight.w400, 25.0),
          Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 40)),
          CustomText(lastname, FontWeight.w400, 25.0),
        ]),
        const Divider(color: Color(0xFFDFF4EC)),
        buildMenuItem(
          text: '${LocalizationHelper.of(context)!.t_account}',
          icon: FeatherIcons.user,
          onClicked: () => selectedItem(context, 0),
        ),
        const Divider(color: Color(0xFFDFF4EC)),
        buildMenuItem(
          text: '${LocalizationHelper.of(context)!.t_address}',
          icon: FeatherIcons.map,
          onClicked: () => selectedItem(context, 1),
        ),
        const Divider(color: Color(0xFFDFF4EC)),
        buildMenuItem(
          text: '${LocalizationHelper.of(context)!.t_property}',
          icon: FeatherIcons.home,
          onClicked: () => selectedItem(context, 2),
        ),
        const Divider(color: Color(0xFFDFF4EC)),
        buildMenuItem(
          text: '${LocalizationHelper.of(context)!.t_bac}',
          icon: FeatherIcons.trash,
          onClicked: () => selectedItem(context, 3),
        ),
        const Divider(color: Color(0xFFDFF4EC)),
        buildMenuItem(
          text: '${LocalizationHelper.of(context)!.t_invoice}',
          icon: FeatherIcons.dollarSign,
          onClicked: () {},
        ),
        const Divider(color: Color(0xFFDFF4EC)),
        buildMenuItem(
          text: '${LocalizationHelper.of(context)!.t_settings}',
          icon: FeatherIcons.settings,
          onClicked: () {},
        ),
        const Divider(color: Color(0xFFDFF4EC)),
        buildMenuItem(
          text: '${LocalizationHelper.of(context)!.t_logout}',
          icon: FeatherIcons.logOut,
          onClicked: () => selectedItem(context, 4),
        ),
        const Divider(color: Color(0xFFDFF4EC)),
      ],
    ));
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
          builder: (context) =>  const AccountForm(false,true,false),
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
        
        late final Box box = Hive.box('auth');
        box.delete('token');
        
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext ctx)=>const SignIn()), (route) => false);
           
    }
  }
}
 