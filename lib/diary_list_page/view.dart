import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:for_miss_sun/widgets/my_app_bar.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(DiaryListState state, Dispatch dispatch, ViewService viewService) {

  ListAdapter adapter = viewService.buildAdapter();
  Widget buildBody(){
    return  SmartRefresher(
      enablePullDown: true,
      enablePullUp: true,
      controller: state.refreshController,
      header: WaterDropMaterialHeader(),
      onRefresh: (){
        dispatch(DiaryListActionCreator.onRefresh());
      },
      onLoading:(){
        dispatch(DiaryListActionCreator.onLoadMore());
      },
      child: ListView.builder(itemBuilder: adapter.itemBuilder,itemCount: adapter.itemCount,controller: state.scrollController,),
      footer: ClassicFooter(),
    );
  }

  return Scaffold(
    appBar: MyAppBar('Diaries',leading: GestureDetector(
      onTap:()=>{},
      child: Icon(Icons.arrow_back_ios),
    ),),
    body: Center(
      child: buildBody(),
    ),
    floatingActionButton: FloatingActionButton(
      mini: true,
      child: IconButton(onPressed: ()=>{
        state.scrollController.animateTo(0, duration: Duration(seconds: 1), curve:Curves.easeInSine )
      }, icon: Icon(Icons.arrow_upward,color: Colors.white,)),
    ),
  );
}
