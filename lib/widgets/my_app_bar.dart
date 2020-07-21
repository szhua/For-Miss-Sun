import 'package:flutter/material.dart';

class MyAppBar extends AppBar {
  final String tilteText;
  final List<Widget> actions;
  final Widget leading ;
  MyAppBar(this.tilteText,{this.actions,this.leading})
      : super(
          leading:leading,
          actions:actions,
          iconTheme:IconThemeData().copyWith(color: Colors.white),
          title: Text(
          tilteText,
          style: TextStyle(fontFamily: 'Title',color: Colors.white),
        ));
}
