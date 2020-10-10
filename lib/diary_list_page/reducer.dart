import 'package:fish_redux/fish_redux.dart';
import 'package:for_miss_sun/diary_list_page/diary_item_component/state.dart';

import 'action.dart';
import 'state.dart';

Reducer<DiaryListState> buildReducer() {
  return asReducer(
    <Object, Reducer<DiaryListState>>{
      DiaryListAction.refresh:_refresh,
      DiaryListAction.loadMore:_loadMore
    },
  );
}


DiaryListState _refresh(DiaryListState state ,Action action){
  final DiaryListState newState = state.clone();
  newState.page =1;
  newState.diaries.clear();
  List<DiaryItemState> diaries =action.payload??<DiaryItemState>[];
  newState.diaries.addAll(diaries);
  return newState;
}

DiaryListState _loadMore(DiaryListState state ,Action action){
  final DiaryListState newState = state.clone();
  List<DiaryItemState> diaries =action.payload??<DiaryItemState>[];
  newState.diaries.addAll(diaries);
  return newState ;
}
