import 'dart:async';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<SloganState> buildEffect() {
  return combineEffects(<Object, Effect<SloganState>>{
     Lifecycle.initState: _initState,
  });
}

void _initState(Action action, Context<SloganState> ctx) {
  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    var currentImage =ctx.state.images[DateTime.now().weekday-1];
    precacheImage(AssetImage(currentImage), ctx.context);
    //ctx.dispatch(SloganActionCreator.setCurrentImg(currentImage));
    Timer(Duration(seconds: 4),(){
      Navigator.of(ctx.context).pushNamed('index_page');
    } );
  });
}
