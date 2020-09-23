import 'package:flutter/material.dart';
import 'package:for_miss_sun/common/index.dart';
import 'package:for_miss_sun/routes/detail_page.dart';
import 'package:for_miss_sun/routes/index.dart';
import 'package:for_miss_sun/util/index.dart';
import 'package:oktoast/oktoast.dart';

void main() {
  Global.init().then((value) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {

var   routes =  <String, WidgetBuilder>{
  "add_diary": (context) => AddDiaryRoute(),
  'for_you_list':(context)=>ForYouListRoute(),
  'homePage':(context)=>MyHomePage(title: 'For Miss-Sun'),
  'detialPage':(context,{arguments}){
    print(arguments);
    return DetailPage(arguments:arguments);
  },
  };


  @override
  Widget build(BuildContext context) {
    return OKToast(
        backgroundColor: Colors.grey,
        radius: 10.0,
        textStyle:
            TextStyle(fontSize: 16.0, color: Colors.white, fontFamily: 'Lei'),
        child: MaterialApp(
          title: 'For Miss-Sun',
          debugShowCheckedModeBanner: false,
          showSemanticsDebugger: false,
          theme: ThemeData(
            primarySwatch: ColorUtil.createMaterialColor(Color(0xffffb6c1)),
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          onGenerateRoute: (RouteSettings set){
            String name=set.name;
            print(' onGenerateRoute set.name = $name');
            ///这里拿到的其实是：JumpPage()
            Function function=routes[name];
            if (function!=null) {
              print(' onGenerateRoute ${function.toString()}');


              if(set.arguments==null){
                return MaterialPageRoute(
                  builder: (context) => function(context),
                );
              }else{
                Route route=MaterialPageRoute(
                    builder: (context)=>function(context,arguments:set?.arguments??{})
                );
                return route;
              }


            }
            return null;
          },
          home: SlogoRoute(),
         // home: MyHomePage(title: 'For Miss-Sun'),
        ));
  }
}
