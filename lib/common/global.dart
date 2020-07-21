

import 'package:data_plugin/bmob/bmob.dart';
import 'package:flutter/cupertino.dart';

class Global {

   static Future init() async{
     WidgetsFlutterBinding.ensureInitialized();
     Bmob.init("https://api2.bmob.cn", "9978d3967eb2807caca03e23d5adbb96", "e90ca06ac042fe14fedccfd7fdbb7a78");
   }

}