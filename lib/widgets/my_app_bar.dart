import 'package:flutter/material.dart';

class MyAppBar extends AppBar {
  final String tilteText;
  final List<Widget> actions;
  final Widget leading ;
  final centerTitle;
  MyAppBar(this.tilteText,{this.actions,this.leading,this.centerTitle=false})
      : super(
          leading:leading,
          actions:actions,
          centerTitle:centerTitle,
          iconTheme:IconThemeData().copyWith(color: Colors.white),
          title: Text(
          tilteText,
          style: TextStyle(fontFamily: 'Title',color: Colors.white),
        ));
}
