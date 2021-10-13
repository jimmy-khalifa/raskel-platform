import 'package:flutter/material.dart';
import 'headerDrawer.dart';
import 'DrawerView.dart';
class SelectView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
     endDrawer:  DrawerView(),
       body: 
         Center(
            child: Container(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height/4,
                child: RaisedButton(
                  color: Colors.green,
                  onPressed: () {},
                  child: Text(
                    'عضوي',
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height/4,
                child: RaisedButton(
                  color: Colors.lightBlue,
                  onPressed: () {},
                  child: Text('بلاستيكي', style: TextStyle(fontSize: 30)),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: MediaQuery.of(context).size.height/4,
                child: RaisedButton(
                  color: Colors.white70,
                  onPressed: () {},
                  child: Text('ورقي', style: TextStyle(fontSize: 30)),
                ),
              ),
          
            ],
          ),
        )));
  }
}
