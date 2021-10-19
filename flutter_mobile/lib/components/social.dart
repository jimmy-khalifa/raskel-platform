import 'package:flutter/material.dart';


class Social extends StatelessWidget {
  const Social({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Card(
       clipBehavior: Clip.antiAlias,
       child: Column(
         children: [
           ListTile(
              leading: Icon(Icons.share,  color:  Color(0xFF65C88D),),
              title: const Text('Sociale',style : TextStyle(color:Color(0xFF65C88D),))
           )
         ],

       )
        
      
    );
    
  }
}