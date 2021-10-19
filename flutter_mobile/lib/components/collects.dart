import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class Collects extends StatelessWidget {
  const Collects({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
       clipBehavior: Clip.antiAlias,
       child: Column(
         children: [
           ListTile(
              leading: FaIcon(FontAwesomeIcons.truck,color:  Color(0xFF65C88D),),
              title: const Text('Collectes',  style : TextStyle(color:Color(0xFF65C88D),))
           )
         ],

       )
        
      
    );
  }
}