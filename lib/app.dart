import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action, Page;
import 'package:for_miss_sun/detail_page/page.dart';
import 'package:for_miss_sun/edit_page/page.dart';
import 'package:for_miss_sun/index_page/page.dart';
import 'package:for_miss_sun/routes/slogo_page.dart';
import 'package:for_miss_sun/util/index.dart';
import 'package:oktoast/oktoast.dart';

import 'diary_list_page/page.dart';
import 'slogan_page/page.dart';

Widget createApp() {

  final AbstractRoutes routes = PageRoutes(
    pages: <String, Page<Object, dynamic>>{
      'index_page': IndexPage(),
      'for_you_list':DiaryListPage(),
      'edit_page':EditDiaryPage(),
      'detail_page':DiaryDetailPage(),
      'slogan_page':SloganPage()
    },
    visitor: (String path, Page<Object, dynamic> page) {
      page.enhancer.append(
        /// View AOP
        viewMiddleware: <ViewMiddleware<dynamic>>[
          safetyView<dynamic>(),
        ],

        /// Adapter AOP
        adapterMiddleware: <AdapterMiddleware<dynamic>>[
          safetyAdapter<dynamic>()
        ],

        /// Effect AOP
        effectMiddleware: <EffectMiddleware<dynamic>>[
          _pageAnalyticsMiddleware<dynamic>(),
        ],

        /// Store AOP
        middleware: <Middleware<dynamic>>[
          logMiddleware<dynamic>(tag: page.runtimeType.toString()),
        ],
      );
    },
  );

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
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute<Object>(builder: (BuildContext context) {
            return routes.buildPage(settings.name, settings.arguments);
          });
        },
        home: routes.buildPage('slogan_page', null)
        // home: MyHomePage(title: 'For Miss-Sun'),
      ));
}

/// 简单的 Effect AOP
/// 只针对页面的生命周期进行打印
EffectMiddleware<T> _pageAnalyticsMiddleware<T>({String tag = 'redux'}) {
  return (AbstractLogic<dynamic> logic, Store<T> store) {
    return (Effect<dynamic> effect) {
      return (Action action, Context<dynamic> ctx) {
        if (logic is Page<dynamic, dynamic> && action.type is Lifecycle) {
          print('${logic.runtimeType} ${action.type.toString()} ');
        }
        return effect?.call(action, ctx);
      };
    };
  };
}
