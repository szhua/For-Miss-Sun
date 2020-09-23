import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:for_miss_sun/models/index.dart';

class DiaryItem extends StatefulWidget {
  final Diary diary;
  DiaryItem(this.diary);
  @override
  State<StatefulWidget> createState() => DiaryItemState();
}

class DiaryItemState extends State<DiaryItem> {



  Widget buildImage(){
   if(widget.diary.dary_img!=null&&widget.diary.dary_img.isNotEmpty){
     return Padding(padding:const EdgeInsets.all(10),child:
     Image(
       image: NetworkImage(
           widget.diary.dary_img),
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


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.of(context).pushNamed('detialPage',arguments: {'objectId':widget.diary.objectId});
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Material(
          color: Colors.white,
          shape: BorderDirectional(
            bottom: BorderSide(
              color: Theme.of(context).dividerColor,
              width: .5,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: <Widget>[
                buildImage(),
                Text(widget.diary.content,style: TextStyle(fontSize: 17,fontFamily: "Lei"),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
