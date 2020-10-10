import 'package:fish_redux/fish_redux.dart';
import 'action.dart';
import 'state.dart';

Effect<DiaryItemState> buildEffect() {
  return combineEffects(<Object, Effect<DiaryItemState>>{
    DiaryItemAction.toDetail: _toDetail,
  });
}

void _toDetail(Action action, Context<DiaryItemState> ctx) {

}
