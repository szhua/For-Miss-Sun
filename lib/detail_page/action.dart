import 'package:fish_redux/fish_redux.dart';

enum DiaryDetailAction { action }

class DiaryDetailActionCreator {
  static Action onAction() {
    return const Action(DiaryDetailAction.action);
  }
}
