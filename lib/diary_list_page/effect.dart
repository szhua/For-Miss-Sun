
import 'package:fish_redux/fish_redux.dart';
import 'package:for_miss_sun/common/bomb.dart';
import 'package:for_miss_sun/diary_list_page/diary_item_component/state.dart';
import 'package:for_miss_sun/models/diary.dart';
import 'action.dart';
import 'state.dart';

Effect<DiaryListState> buildEffect() {
  return combineEffects(<Object, Effect<DiaryListState>>{
    DiaryListAction.onRefresh:_onRefresh,
    DiaryListAction.onLoadMore:_onLoadMore,
    Lifecycle.initState:_onRefresh
  });
}



void _onRefresh(Action action, Context<DiaryListState> ctx) async {
  ctx.state.hasMore =true ;
  List<Diary> data = await  BombApi(ctx.context).getPageData(page: 1,count: 10);
  ctx.dispatch(DiaryListActionCreator.refresh(data.map((e) => DiaryItemState(diary: e)).toList()));
  ctx.state.refreshController.refreshCompleted();
}
void _onLoadMore(Action action, Context<DiaryListState> ctx) async {
  if(ctx.state.hasMore) {
    ctx.state.page++;
    List<Diary> data = await BombApi(ctx.context).getPageData(
        page: ctx.state.page, count: ctx.state.count);
    ctx.dispatch(DiaryListActionCreator.loadMore(
        data.map((e) => DiaryItemState(diary: e)).toList()));
    ctx.state.refreshController.loadComplete();
  }else{
    ctx.state.refreshController.loadNoData();
  }
}