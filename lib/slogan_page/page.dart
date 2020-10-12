import 'package:fish_redux/fish_redux.dart';

import 'effect.dart';
import 'reducer.dart';
import 'state.dart';
import 'view.dart';

class SloganPage extends Page<SloganState, Map<String, dynamic>> {
  SloganPage()
      : super(
            initState: initState,
            effect: buildEffect(),
            reducer: buildReducer(),
            view: buildView,
            dependencies: Dependencies<SloganState>(
                adapter: null,
                slots: <String, Dependent<SloganState>>{
                }),
            middleware: <Middleware<SloganState>>[
            ],);

}
