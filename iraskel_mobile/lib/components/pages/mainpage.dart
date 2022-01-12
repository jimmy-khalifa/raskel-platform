import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:iraskel_mobile/components/atoms/_floatingbutton.dart';
import 'package:iraskel_mobile/components/molecules/_bottomnavigationbar.dart';
import 'package:iraskel_mobile/components/pages/calendarpage.dart';
import 'package:iraskel_mobile/components/pages/homepage.dart';
import 'package:iraskel_mobile/components/pages/menupage.dart';
import 'package:iraskel_mobile/components/pages/notificationpage.dart';
import 'package:iraskel_mobile/components/pages/signin.dart';
import 'package:iraskel_mobile/localizations/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPage extends StatefulWidget {
  //final Map<String, dynamic> user;
 // final bool visible;
  // ignore: use_key_in_widget_constructors
  const MainPage();

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  ontap(index) {
    setState(() => currentIndex = index);
  }

  onpressed() {}

    
  @override
  Widget build(BuildContext context) {
     
     final _isVisible = true;

   final screens = [ HomePage(),  const NotificationPage(),  const CalendarPage(),  const MenuPage(), Logout()];
           
        
   
    return Scaffold(
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      floatingActionButton: Visibility(
        visible:_isVisible,
        child:
          CustomFloatingButton(0xFF65C88D, FeatherIcons.plus, onpressed),),
      bottomNavigationBar: NavigationBar(
          0xFF65C88D,
          0xFF78D0B4,
          FeatherIcons.home,
          FeatherIcons.bell,
          FeatherIcons.calendar,
          FeatherIcons.menu,
          FeatherIcons.logOut,
          '${LocalizationHelper.of(context)!.t_home}',
          '${LocalizationHelper.of(context)!.t_notification}',
          '${LocalizationHelper.of(context)!.t_calendar}',
          '${LocalizationHelper.of(context)!.t_menu}',
          'logout',
          currentIndex,
          ontap),
    );
  }
}
class Logout extends  StatelessWidget {
  const Logout({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
          onPressed: () async {
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.remove('token');
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (BuildContext ctx) => SignIn()));
          },
          child: Text('Logout'),
        ),
      
    );
  }
}
