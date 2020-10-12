import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:for_miss_sun/widgets/index.dart';
import 'state.dart';

Widget buildView(DiaryDetailState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
      appBar: MyAppBar(
        'ForYou',
        leading: GestureDetector(
          onTap:(){},
          child: Text(''),
        ),
        centerTitle: true,
        actions: <Widget>[
        ],
      ),
      body: viewService.buildComponent("diaryDetail"));
}
