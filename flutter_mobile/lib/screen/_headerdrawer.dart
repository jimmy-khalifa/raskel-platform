import 'package:flutter/material.dart';

class HeaderDrawer extends StatefulWidget {
    const HeaderDrawer({Key? key}) : super(key: key);

  @override
  _HeaderDrawerState createState() => _HeaderDrawerState();
}

class _HeaderDrawerState extends State<HeaderDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
      width: double.infinity,
      height: 200,
      padding:const EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 90,
            width: 90,
            decoration:const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/user_profile.png'),
                //image: NetworkImage(
                    //"https://images.pexels.com/photos/462118/pexels-photo-462118.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Text(' فلان الفلاني', style: TextStyle(fontSize: 20, ),),
        ],
      ),
    );
  }
}
