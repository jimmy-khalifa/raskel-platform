import 'package:flutter/material.dart';
import 'package:iraskel_mobile/components/atoms/_icon.dart';

class NavigationBar extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final  color1;
  // ignore: prefer_typing_uninitialized_variables
  final  color2;
  // ignore: prefer_typing_uninitialized_variables
  final name1;
  // ignore: prefer_typing_uninitialized_variables
  final name2;
  // ignore: prefer_typing_uninitialized_variables
  final name3;
  // ignore: prefer_typing_uninitialized_variables
  final name4;
  // ignore: prefer_typing_uninitialized_variables
  final name5;
  final String text1;
  final String text2;
  final String text3;
  final String text4;
  final String text5;
  final Function ontap;
  final int currentIndex;
  //final int currentIndex;
  

  // ignore: use_key_in_widget_constructors
  const NavigationBar(this.color1,this.color2, this.name1, this.name2, this.name3,
      this.name4,this.name5, this.text1, this.text2, this.text3, this.text4,this.text5,this.currentIndex,this.ontap);

  @override
  State<NavigationBar> createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
 // int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
        iconSize: 30,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: widget.currentIndex,
       // onTap: (index) => setState(() =>currentIndex = index),
       onTap: (index){
         widget.ontap(index);
       },
        items: [
          BottomNavigationBarItem(icon: CustomIcon(widget.name1, widget.color1),
          activeIcon: CustomIcon(widget.name1, widget.color2),
          label: widget.text1
          ),
          BottomNavigationBarItem(icon: CustomIcon(widget.name2, widget.color1),
          activeIcon: CustomIcon(widget.name2, widget.color2),
          label: widget.text2
          ),
          BottomNavigationBarItem(icon: CustomIcon(widget.name3, widget.color1),
          activeIcon: CustomIcon(widget.name3, widget.color2),
          label: widget.text3
          ),
          BottomNavigationBarItem(icon: CustomIcon(widget.name4, widget.color1),
          activeIcon: CustomIcon(widget.name4, widget.color2),
          label: widget.text4
          ),
           BottomNavigationBarItem(icon: CustomIcon(widget.name5, widget.color1),
          activeIcon: CustomIcon(widget.name5, widget.color2),
          label: widget.text5,
          
          ),
          ]);
  }
}
