import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'action.dart';
import 'state.dart';

Effect<DiaryItemState> buildEffect() {
  return combineEffects(<Object, Effect<DiaryItemState>>{
    DiaryItemAction.toDetail: _toDetail,
  });
}

void _toDetail(Action action, Context<DiaryItemState> ctx) {
  Navigator.of(ctx.context).pushNamed('detail_page',arguments: ctx.state);
}
