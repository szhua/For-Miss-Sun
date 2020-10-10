import 'package:date_format/date_format.dart';
import 'package:fish_redux/fish_redux.dart';
import 'package:for_miss_sun/models/diary.dart';

class DetailState implements Cloneable<DetailState> {

  Diary diary ;

  DetailState({this.diary});

  @override
  DetailState clone() {
    return DetailState()..diary=diary;
  }
}


