

import 'package:flukit/flukit.dart';
import 'package:flutter/material.dart';
import 'package:for_miss_sun/common/bomb.dart';
import 'package:for_miss_sun/common/index.dart';
import 'package:for_miss_sun/models/diary.dart';
import 'package:for_miss_sun/widgets/index.dart';

class ForYouListRoute extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => ForYouListRouteState();
}

class ForYouListRouteState extends State<ForYouListRoute>{

  int count =10 ;

  upTop(){
    _controller.animateTo(.0,
        duration: Duration(milliseconds: 200),
        curve: Curves.ease
    );
  }
  ScrollController _controller = new ScrollController();

  Widget buildBody(){
    return InfiniteListView<Diary>(
      scrollController: _controller,
        onRetrieveData: (int page, List<Diary> items, bool refresh) async {
           var data = await  BombApi(context).getPageData(page: page,count: count);
           items.addAll(data);
           return data.length > 0 && data.length % 10 == 0;
        },
        itemBuilder: (List list, int index, BuildContext ctx){
          return DiaryItem(list[index]);
        },
    );
  }

  _back(){
    bus.emit('refreshHome', {});
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar('Diaries',leading: GestureDetector(
          onTap:_back,
          child: Icon(Icons.arrow_back_ios),
        ),),
        body: Center(
          child: buildBody(),
        ),
       floatingActionButton: FloatingActionButton(
         mini: true,
          child: IconButton(onPressed: upTop, icon: Icon(Icons.arrow_upward,color: Colors.white,)),
       ),
    );
  }

}