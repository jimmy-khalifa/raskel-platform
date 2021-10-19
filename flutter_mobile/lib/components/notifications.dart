import 'package:flutter/material.dart';


class Notifications extends StatelessWidget {
  const Notifications({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Card(
       clipBehavior: Clip.antiAlias,
       child: Column(
         children: [
           ListTile(
              leading: Icon(Icons.notifications_none_outlined,color:  Color(0xFF65C88D),),
              title: const Text('Notifications',/*style:Theme.of(context).textTheme.headline1,*/)
           )
         ],

       )
        
      
    );
  }
}