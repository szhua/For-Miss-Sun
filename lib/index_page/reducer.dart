import 'package:date_format/date_format.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:for_miss_sun/index_page/detail_component/state.dart';
import 'package:for_miss_sun/models/diary.dart';

import 'action.dart';
import 'state.dart';

Reducer<IndexState> buildReducer() {
  return asReducer(
    <Object, Reducer<IndexState>>{
        IndexAction.initIndexData:_refreshIndexData
    },
  );
}

IndexState _refreshIndexData(IndexState state, Action action) {
  final Diary diary = action.payload ?? Diary();
  final IndexState newState = state.clone();
  newState.diary =diary;
  return newState;
}
