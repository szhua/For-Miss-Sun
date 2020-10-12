import 'package:fish_redux/fish_redux.dart';

enum DiaryItemAction { toDetail ,onDelete}

class DiaryItemActionCreator {
  static Action toDetail(String objectId) {
    return  Action(DiaryItemAction.toDetail,payload: objectId);
  }

  static Action onDelete(){
    return Action(DiaryItemAction.onDelete);
  }

}
