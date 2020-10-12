import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:for_miss_sun/edit_page/action.dart';
import 'package:for_miss_sun/widgets/index.dart';
import 'state.dart';

Widget buildView(
    EditDiaryState state, Dispatch dispatch, ViewService viewService) {
  final TextStyle normalStyle = TextStyle(fontFamily: "Lei", fontSize: 20);

  Widget buildImg() {
    if (state.image != null) {
      return Card(
        margin: EdgeInsets.all(4),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          child: Image.file(
            state.image,
            fit: BoxFit.cover,
          ),
        ),
      );
    } else {
      return Center(
        child: Text(
          '添加图片',
          style: normalStyle,
        ),
      );
    }
  }

  return Scaffold(
      appBar: MyAppBar(
        '添加',
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              dispatch(EditDiaryActionCreator.onSaveDiary());
            },
            child: Icon(
              Icons.check,
              color: Colors.white,
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dispatch(EditDiaryActionCreator.onChooseImg());
        },
        child: Icon(
          Icons.add_a_photo,
          color: Colors.white,
        ),
      ),
      body: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Center(
          child: ListView(
            children: <Widget>[
              DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(3.0), //3像素圆角
                ),
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: TextField(
                    focusNode: state.focusNode,
                    controller: state.contentEditController,
                    autofocus: false,
                    maxLength: 500,
                    maxLines: 8,
                    style: TextStyle(fontSize: 19, fontFamily: 'Lei'),
                    decoration: InputDecoration(
                        hintText: '输入今日你想说的话吧!',
                        hintStyle:
                            TextStyle(color: Colors.grey, fontFamily: 'Lei'),
                        border: InputBorder.none),
                  ),
                ),
              ),
              AspectRatio(
                aspectRatio: 1000 / 618,
                child: Card(
                  child: buildImg(),
                ),
              )
            ],
          ),
        ),
      ));
}
