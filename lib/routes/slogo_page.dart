import 'dart:async';

import 'package:flutter/material.dart';

class SlogoRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SlogoRouteState();
}



class _SlogoRouteState extends State<SlogoRoute> {
  
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),(){
      Navigator.of(context).pushNamed('homePage');
    } );
  }
  
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          fit: StackFit.expand, //未定位widget占满Stack整个空间
          children: <Widget>[
            Image(
                image: AssetImage('assets/imgs/foryou2.jpg'), fit: BoxFit.cover),
            Positioned(
                bottom: 0,
                child: Container(
                  height: 50,
                  child: Text('一心一意是最好的温柔',style: TextStyle(fontFamily: 'Lei',color: Colors.white,fontSize: 17),),
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: Color(0x55000000)),
                )),
          ],
        ),
      ),
    );
  }
}
