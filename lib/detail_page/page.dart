import 'package:fish_redux/fish_redux.dart';
import 'package:for_miss_sun/diary_list_page/diary_item_component/state.dart' hide initState;
import 'package:for_miss_sun/index_page/detail_component/component.dart';
import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class DiaryDetailPage extends Page<DiaryDetailState, DiaryItemState> {
  DiaryDetailPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<DiaryDetailState>(
                adapter: null,
                slots: <String, Dependent<DiaryDetailState>>{
                  'diaryDetail':DetailConnector()+DetailComponent()
                }),
            middleware: <Middleware<DiaryDetailState>>[
            ],);

}
