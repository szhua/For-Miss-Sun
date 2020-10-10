import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'state.dart';

Widget buildView(DetailState state, Dispatch dispatch, ViewService viewService) {

  Widget buildImage() {
    if (state.diary.dary_img != null && state.diary.dary_img.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Image(
          image: NetworkImage(state.diary.dary_img),
          width: double.infinity,
          height: 200,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return Offstage(
        offstage: true,
        child: Container(),
      );
    }
  }


  _buildContent() {
    if (state.diary != null) {
      return Column(
        children: <Widget>[
          buildImage(),
          Text(
            state.diary.content,
            style: TextStyle(fontFamily: 'Lei', fontSize: 19),
          )
        ],
      );
    } else {
      return Container();
    }
  }

  return SingleChildScrollView(
    child: Center(
        child: Container(
          child: Card(
            margin: EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                constraints: BoxConstraints(minHeight: 300),
                alignment: Alignment.center,
                width: double.infinity,
                child: Column(
                  children: <Widget>[_buildContent()],
                ),
              ),
            ),
          ),
        )),
  );




}
