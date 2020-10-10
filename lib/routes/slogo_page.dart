import 'dart:async';

import 'package:flutter/material.dart';

class SlogoRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SlogoRouteState();
}



class _SlogoRouteState extends State<SlogoRoute> {

  var imgs = <String>[
    'assets/imgs/day1.jpg',
    'assets/imgs/day2.jpg',
    'assets/imgs/day3.jpg',
    'assets/imgs/day4.jpg',
    'assets/imgs/day5.jpg',
    'assets/imgs/day6.jpg',
    'assets/imgs/day7.jpg',
  ];

  
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var currentImage =imgs[DateTime.now().weekday-1];
      precacheImage(AssetImage(currentImage), context);
      Timer(Duration(seconds: 4),(){
        Navigator.of(context).pushNamed('index_page');
      } );
    });
  }
  
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          fit: StackFit.expand, //未定位widget占满Stack整个空间
          children: <Widget>[
            Image(
                image: AssetImage(imgs[DateTime.now().weekday-1]), fit: BoxFit.cover),
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
