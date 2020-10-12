import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'state.dart';

Widget buildView(SloganState state, Dispatch dispatch, ViewService viewService) {
  return Scaffold(
    body: Container(
      child: Stack(
        fit: StackFit.expand, //未定位widget占满Stack整个空间
        children: <Widget>[
          Image(
              image: state.currentImg, fit: BoxFit.cover),
          Positioned(
              bottom: 0,
              child: Container(
                height: 50,
                child: Text('一心一意是最好的温柔',style: TextStyle(fontFamily: 'Lei',color: Colors.white,fontSize: 17),),
                alignment: Alignment.center,
                width: MediaQuery.of(viewService.context).size.width,
                decoration: BoxDecoration(color: Color(0x55000000)),
              )),
        ],
      ),
    ),
  );
}
