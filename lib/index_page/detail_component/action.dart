import 'package:fish_redux/fish_redux.dart';

enum DetailAction { onClick }

class DetailActionCreator {
  static Action onClick(String objectId) {
    return  Action(DetailAction.onClick,payload: objectId);
  }
}
