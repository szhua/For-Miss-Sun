import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class DetailComponent extends Component<DetailState> {
  DetailComponent()
      : super(
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<DetailState>(
                adapter: null,
                slots: <String, Dependent<DetailState>>{
                }),);

}
