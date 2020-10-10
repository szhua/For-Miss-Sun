import 'package:fish_redux/fish_redux.dart';
import 'package:for_miss_sun/diary_list_page/state.dart';
import 'action.dart';

Reducer<DiaryListState> buildReducer() {
  return asReducer(
    <Object, Reducer<DiaryListState>>{
      DiaryItemAdapterAction.action: _onAction,
    },
  );
}

DiaryListState _onAction(DiaryListState state, Action action) {
  final DiaryListState newState = state.clone();
  return newState;
}
