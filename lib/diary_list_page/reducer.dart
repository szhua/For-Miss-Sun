import 'package:fish_redux/fish_redux.dart';
import 'package:for_miss_sun/diary_list_page/diary_item_component/state.dart';
import 'action.dart';
import 'state.dart';

Reducer<DiaryListState> buildReducer() {
  return asReducer(
    <Object, Reducer<DiaryListState>>{
      DiaryListAction.refresh:_refresh,
      DiaryListAction.loadMore:_loadMore,
      DiaryListAction.delete:_delete
    },
  );
}

DiaryListState _delete(DiaryListState state ,Action action){
  final DiaryListState newState = state.clone();
  DiaryItemState itemState =action.payload;
  newState.diaries.remove(itemState);
  return newState ;
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
  if(diaries.isEmpty){
    newState.hasMore =false;
  }
  return newState ;
}
