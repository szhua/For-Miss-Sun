import 'package:fish_redux/fish_redux.dart';
import 'package:for_miss_sun/diary_list_page/diary_item_component/state.dart';
import 'package:for_miss_sun/index_page/detail_component/state.dart';
import 'package:for_miss_sun/models/diary.dart';

class DiaryDetailState implements Cloneable<DiaryDetailState> {

  Diary diary ;
  @override
  DiaryDetailState clone() {
    return DiaryDetailState()..diary=diary;
  }
}

DiaryDetailState initState(DiaryItemState diaryItemState) {
  return DiaryDetailState()..diary =diaryItemState.diary;
}


class DetailConnector extends ConnOp<DiaryDetailState,DetailState> with ReselectMixin<DiaryDetailState,DetailState>{
  @override
  DetailState computed(DiaryDetailState state) {
    return DetailState()
      ..diary = state.diary;
  }
}