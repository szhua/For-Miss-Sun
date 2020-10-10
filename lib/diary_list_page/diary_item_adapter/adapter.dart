import 'package:fish_redux/fish_redux.dart';
import 'package:for_miss_sun/diary_list_page/diary_item_component/component.dart';
import 'package:for_miss_sun/diary_list_page/state.dart';
import 'reducer.dart';

class DiaryItemAdapter extends SourceFlowAdapter<DiaryListState> {
  DiaryItemAdapter()
      : super(
    pool: <String, Component<Object>>{
      'diaryItem': DiaryItemComponent(),
    },
    reducer: buildReducer(),
  );
}
