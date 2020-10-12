import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<DiaryDetailState> buildReducer() {
  return asReducer(
    <Object, Reducer<DiaryDetailState>>{
      DiaryDetailAction.action: _onAction,
    },
  );
}

DiaryDetailState _onAction(DiaryDetailState state, Action action) {
  final DiaryDetailState newState = state.clone();
  return newState;
}
