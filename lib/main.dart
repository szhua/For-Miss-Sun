import 'package:flutter/material.dart';
import 'package:for_miss_sun/common/index.dart';
import 'package:for_miss_sun/routes/index.dart';
import 'package:for_miss_sun/util/index.dart';
import 'package:oktoast/oktoast.dart';

void main() {
  Global.init().then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OKToast(
        backgroundColor: Colors.grey,
        radius: 10.0,
        textStyle:
            TextStyle(fontSize: 16.0, color: Colors.white, fontFamily: 'Lei'),
        child: MaterialApp(
          title: 'For Miss-Sun',
          theme: ThemeData(
            primarySwatch: ColorUtil.createMaterialColor(Color(0xffffb6c1)),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          routes: <String, WidgetBuilder>{
            "add_diary": (context) => AddDiaryRoute(),
            'for_you_list':(context)=>ForYouListRoute(),
          },
          home: MyHomePage(title: 'For Miss-Sun'),
        ));
  }
}
