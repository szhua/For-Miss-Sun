import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:for_miss_sun/diary_list_page/action.dart';
import 'package:for_miss_sun/index_page/action.dart';
import 'package:for_miss_sun/index_page/page.dart';
import 'package:for_miss_sun/models/diary.dart';
import 'package:for_miss_sun/models/mobdiary.dart';
import 'action.dart';
import 'state.dart';


final TextStyle normalStyle = TextStyle(fontFamily: "Lei");

Effect<DiaryItemState> buildEffect() {
  return combineEffects(<Object, Effect<DiaryItemState>>{
    DiaryItemAction.toDetail: _toDetail,
    DiaryItemAction.onDelete: _onDelete,
  });
}

void _toDetail(Action action, Context<DiaryItemState> ctx) {
  Navigator.of(ctx.context).pushNamed('detail_page', arguments: ctx.state);
}

void _onDelete(Action action, Context<DiaryItemState> ctx) {
  showDialog(
      barrierDismissible: true,
      context: ctx.context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示",style: normalStyle,),
          content: Text("要删除此条Diary吗?",style: normalStyle),
          actions: <Widget>[
            FlatButton(
              child: Text("取消",style: normalStyle),
              onPressed: () => Navigator.of(context).pop(), // 关闭对话框
            ),
            FlatButton(
              child: Text("删除",style: normalStyle),
              onPressed: () async{
                diary currentDiary = diary();
                currentDiary.objectId = ctx.state.diary.objectId;
                currentDiary.delete().then((value){
                   ctx.dispatch(DiaryListActionCreator.delete(ctx.state));
                   ctx.broadcast(IndexActionCreator.refreshHomeData());
                   Navigator.of(context).pop(true);
                 });
              },
            ),
          ],
        );
      });
}
