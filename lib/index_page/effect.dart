import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:for_miss_sun/common/bomb.dart';
import 'package:for_miss_sun/models/diary.dart';
import 'action.dart';
import 'state.dart';


Effect<IndexState> buildEffect() {
  return combineEffects(<Object, Effect<IndexState>>{
    Lifecycle.initState:_init,
    IndexAction.toDiaryList:_toList,
    IndexAction.toAdd:_toAdd
  });
}

void _init(Action action, Context<IndexState> ctx) async {
   Diary diary = await BombApi().getLatestOne();
   ctx.dispatch(IndexActionCreator.initIndexData(diary));
}
void _toList(Action action ,Context<IndexState> ctx) {
    Navigator.of(ctx.context).pushNamed('for_you_list');
}
void _toAdd(Action action ,Context<IndexState> ctx) {
  Navigator.of(ctx.context).pushNamed('edit_page');
}
