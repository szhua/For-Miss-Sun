import 'package:fish_redux/fish_redux.dart';
import 'package:for_miss_sun/diary_list_page/diary_item_component/state.dart';

//TODO replace with your own action
enum DiaryListAction { action ,onRefresh,refresh,onLoadMore,loadMore }

class DiaryListActionCreator {
  static Action onAction() {
    return const Action(DiaryListAction.action);
  }
  static Action onRefresh(){
    return const Action(DiaryListAction.onRefresh);
  }
  static Action onLoadMore(){
    return const Action(DiaryListAction.onLoadMore);
  }
  static Action refresh( List<DiaryItemState> items  ){
    return  Action(DiaryListAction.refresh ,payload: items);
  }
  static Action loadMore(List<DiaryItemState> items){
    return  Action(DiaryListAction.loadMore,payload: items);
  }

}
