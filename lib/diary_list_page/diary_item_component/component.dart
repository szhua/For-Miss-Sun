import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class DiaryItemComponent extends Component<DiaryItemState> {
  DiaryItemComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<DiaryItemState>(
                adapter: null,
                slots: <String, Dependent<DiaryItemState>>{
                }),);

}
