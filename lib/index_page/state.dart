import 'package:fish_redux/fish_redux.dart';
import 'package:for_miss_sun/index_page/detail_component/state.dart';
import 'package:for_miss_sun/models/diary.dart';

class IndexState implements Cloneable<IndexState> {

  Diary diary ;

  @override
  IndexState clone() {
    return IndexState()..diary=diary;
  }
}

IndexState initState(Map<String, dynamic> args) {
  return IndexState();
}

class DetailConnector extends ConnOp<IndexState,DetailState> with ReselectMixin<IndexState,DetailState>{
  @override
  DetailState computed(IndexState state) {
    return DetailState()
      ..diary = state.diary;
  }

}