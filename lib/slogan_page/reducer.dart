import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'state.dart';

Reducer<SloganState> buildReducer() {
  return asReducer(
    <Object, Reducer<SloganState>>{
      SloganAction.setCurrentImg: _setCurrentImg,
    },
  );
}

SloganState _setCurrentImg(SloganState state, Action action) {
  final SloganState newState = state.clone();
  newState.currentImg = new AssetImage(action.payload);
  return newState;
}
