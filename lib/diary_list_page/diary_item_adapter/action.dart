import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum DiaryItemAdapterAction { action }

class DiaryItemAdapterActionCreator {
  static Action onAction() {
    return const Action(DiaryItemAdapterAction.action);
  }
}
