import 'package:fish_redux/fish_redux.dart';

import 'action.dart';
import 'state.dart';

Reducer<EditDiaryState> buildReducer() {
  return asReducer(
    <Object, Reducer<EditDiaryState>>{
      EditDiaryAction.saveDiary: _saveDiary,
      EditDiaryAction.setChooseImg:_setChooseImg
    },
  );
}

EditDiaryState _saveDiary(EditDiaryState state, Action action) {
  final EditDiaryState newState = state.clone();
  return newState;
}

EditDiaryState _setChooseImg(EditDiaryState state ,Action action){
  final EditDiaryState newState = state.clone();
  newState.image =action.payload;
  return newState;
}


