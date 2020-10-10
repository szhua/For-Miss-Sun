import 'package:fish_redux/fish_redux.dart';
import 'package:for_miss_sun/models/diary.dart';


enum IndexAction { initIndexData  , toDiaryList ,toAdd ,back}

class IndexActionCreator {

  static Action initIndexData(Diary diary){
    return Action(IndexAction.initIndexData,payload: diary);
  }
  static Action toDiaryList(){
     return const Action(IndexAction.toDiaryList);
  }
  static Action toAdd(){
     return const Action(IndexAction.toAdd);
  }
  static Action  back(){
    return const Action(IndexAction.back);
  }

}
