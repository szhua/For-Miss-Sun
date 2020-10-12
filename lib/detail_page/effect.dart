import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<DiaryDetailState> buildEffect() {
  return combineEffects(<Object, Effect<DiaryDetailState>>{
    Lifecycle.initState: _initState,
  });
}


void _initState(Action action, Context<DiaryDetailState> ctx) {

}
