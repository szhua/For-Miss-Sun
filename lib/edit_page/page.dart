import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class EditDiaryPage extends Page<EditDiaryState, Map<String, dynamic>> {
  EditDiaryPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<EditDiaryState>(
                adapter: null,
                slots: <String, Dependent<EditDiaryState>>{
                }),
            middleware: <Middleware<EditDiaryState>>[
            ],);

}
