import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:for_miss_sun/index_page/page.dart';
import 'package:for_miss_sun/widgets/my_app_bar.dart';
import 'package:oktoast/oktoast.dart';
import 'action.dart';
import 'state.dart';

Widget buildView(IndexState state, Dispatch dispatch, ViewService viewService) {


  DateTime _lastPressedAt; //上次点击时间
  Future<bool> _back() async{
    if (_lastPressedAt == null ||DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)) {
      //两次点击间隔超过1秒则重新计时
      _lastPressedAt = DateTime.now();
      showToast('再按一次退出程序',position: ToastPosition.bottom);
      return false;
    }
    await SystemNavigator.pop();
    return false;
  }

  return WillPopScope(
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            mini: true,
            child: IconButton(
              onPressed: ()  {
                dispatch(IndexActionCreator.toAdd());
              },
              icon: Icon(
                Icons.keyboard,
                color: Colors.white,
              ),
            ),
          ),
          appBar: MyAppBar(
            "Diary",
            leading: GestureDetector(
              onTap: () {},
              child: Text(''),
            ),
            centerTitle: true,
            actions: <Widget>[
              GestureDetector(
                onTap: (){
                  dispatch(IndexActionCreator.toDiaryList());
                },
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 12),
                  child: Icon(
                    Icons.library_books,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),
          body: viewService.buildComponent("diaryDetail"),
      ),onWillPop: _back,);
}
