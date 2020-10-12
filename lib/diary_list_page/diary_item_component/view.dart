import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:for_miss_sun/diary_list_page/diary_item_component/action.dart';
import 'state.dart';

Widget buildView(
    DiaryItemState state, Dispatch dispatch, ViewService viewService) {

  Widget buildImage(){
    if(state.diary.dary_img!=null&&state.diary.dary_img.isNotEmpty){
      return Padding(padding:const EdgeInsets.all(10),child:
      Image(
        image: NetworkImage(
            state.diary.dary_img),
        width: double.infinity,
        height: 200,
        fit: BoxFit.cover,
      ),);
    }else{
      return Offstage(
        offstage: true,
        child: Container(),
      ) ;
    }
  }

  return InkWell(
    onLongPress: (){
      dispatch(DiaryItemActionCreator.onDelete());
    },
    onTap: (){
      dispatch(DiaryItemActionCreator.toDetail(state.diary.objectId));
    },
    child: Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Material(
        color: Colors.white,
        shape: BorderDirectional(
          bottom: BorderSide(
            color: Theme.of(viewService.context).dividerColor,
            width: .5,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              buildImage(),
              Text(
                state.diary.content,
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 17, fontFamily: "Lei"),
              )
            ],
          ),
        ),
      ),
    ),
  );
}
