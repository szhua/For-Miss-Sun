import 'package:fish_redux/fish_redux.dart';

enum DiaryItemAction { toDetail }

class DiaryItemActionCreator {
  static Action toDetail(String objectId) {
    return  Action(DiaryItemAction.toDetail,payload: objectId);
  }
}
