import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum DiaryDetailAction { action }

class DiaryDetailActionCreator {
  static Action onAction() {
    return const Action(DiaryDetailAction.action);
  }
}
