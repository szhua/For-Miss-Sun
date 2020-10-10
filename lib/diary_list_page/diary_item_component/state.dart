import 'package:date_format/date_format.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:for_miss_sun/models/diary.dart';

class DiaryItemState implements Cloneable<DiaryItemState> {


  Diary diary ;

  DiaryItemState({this.diary});

  @override
  DiaryItemState clone() {
    return DiaryItemState()..diary=diary;
  }
}

DiaryItemState initState(Map<String, dynamic> args) {
  return DiaryItemState();
}
