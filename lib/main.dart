import 'package:flutter/material.dart';
import 'package:for_miss_sun/common/index.dart';

import 'app.dart';

void main() {
  Global.init().then((value) => runApp(createApp()));
}
