import 'package:fish_redux/fish_redux.dart';
import 'package:for_miss_sun/diary_list_page/diary_item_adapter/adapter.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class DiaryListPage extends Page<DiaryListState, Map<String, dynamic>> {
  DiaryListPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<DiaryListState>(
                adapter: NoneConn<DiaryListState>()+DiaryItemAdapter(),
                slots: <String, Dependent<DiaryListState>>{
                }),
            middleware: <Middleware<DiaryListState>>[
            ],);

}
