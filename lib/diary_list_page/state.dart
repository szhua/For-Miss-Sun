import 'package:date_format/date_format.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:for_miss_sun/diary_list_page/diary_item_component/state.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DiaryListState extends MutableSource
    implements Cloneable<DiaryListState> {
  List<DiaryItemState> diaries;
  RefreshController refreshController;
  ScrollController scrollController =new ScrollController() ;
  int page;
  int count;

  @override
  DiaryListState clone() {
    return DiaryListState()
      ..diaries = diaries
      ..page=page
      ..count=count
      ..scrollController=scrollController
      ..refreshController = refreshController;
  }

  @override
  Object getItemData(int index) {
    return diaries[index];
  }

  @override
  String getItemType(int index) => 'diaryItem';

  @override
  int get itemCount => diaries?.length ?? 0;

  @override
  void setItemData(int index, Object data) => diaries[index] = data;
}

DiaryListState initState(Map<String, dynamic> args) {
  return DiaryListState()
    ..refreshController = new RefreshController()
    ..page = 1
    ..scrollController =new ScrollController()
    ..diaries =<DiaryItemState>[]
    ..count = 10;
}
