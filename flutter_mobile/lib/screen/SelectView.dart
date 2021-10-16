import 'package:flutter/material.dart';
import 'headerDrawer.dart';
import 'DrawerView.dart';
import 'waitView.dart';
class SelectView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
           elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          
        ),
       endDrawer: DrawerView(),
        body: Center(
            child: Container(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 5,
                child: RaisedButton(
                  color: Colors.green,
                  onPressed: () {
                     Navigator.push(context, 
                     MaterialPageRoute(builder: (context)=> WaitView()),
                     );
                  },
                  child: Text(
                    'عضوي',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 5,
                child: RaisedButton(
                  color: Colors.lightBlue,
                  onPressed: () {
                    Navigator.push(context, 
                     MaterialPageRoute(builder: (context)=> WaitView()),
                     );
                  },
                  child: Text('بلاستيكي', style: TextStyle(fontSize: 30)),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 5,
                child: RaisedButton(
                  color: Colors.white70,
                  onPressed: () {
                     Navigator.push(context, 
                     MaterialPageRoute(builder: (context)=> WaitView()),
                     );
                  },
                  child: Text('ورقي', style: TextStyle(fontSize: 30)),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 5,
                child: RaisedButton(
                  color: Colors.white70,
                  onPressed: () {
                     Navigator.push(context, 
                     MaterialPageRoute(builder: (context)=> WaitView()),
                     );
                  },
                  child: Text('مختلط', style: TextStyle(fontSize: 30)),
                ),
              ),
            ],
          ),
        )));
  }
}
