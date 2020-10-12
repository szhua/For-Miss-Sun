import 'dart:io';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart' hide Action;
import 'package:for_miss_sun/common/index.dart';
import 'package:for_miss_sun/index_page/action.dart';
import 'package:for_miss_sun/models/diary.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oktoast/oktoast.dart';
import 'action.dart';
import 'state.dart';

Effect<EditDiaryState> buildEffect() {
  return combineEffects(<Object, Effect<EditDiaryState>>{
    EditDiaryAction.onSaveDiary: _onSaveDiary,
    EditDiaryAction.onChooseImg:_onChooseImg,
  });
}

void _onSaveDiary(Action action, Context<EditDiaryState> ctx) async{
  EditDiaryState state =  ctx.state ;
  if(state.contentEditController.text == null||state.contentEditController.text.isEmpty){
    showToast('内容不能为空');
    return ;
  }
  if(state.image==null){
    showToast('图片必须上传');
    return ;
  }
  showLoading(ctx.context);
  var fileResponse =  await YouPai(ctx.context) .uploadFile(state.image);
  if(fileResponse.status ==100) {
    String filePath = fileResponse.data;
    String content = state.contentEditController.text;
    var  diary = await BombApi(ctx.context).insertOneDiary(Diary()..content=content..dary_img=filePath);
    if(diary!=null){
      showToast('上传成功');
      state.focusNode.unfocus();
      ctx.broadcast(IndexActionCreator.refreshHomeData());
      Navigator.of(ctx.context).pop();
      Navigator.of(ctx.context).pop();
    }else{
      showToast('上传失败');
      state.focusNode.unfocus();
      Navigator.of(ctx.context).pop();
    }
  }else{
    showToast('上传图片失败');
    state.focusNode.unfocus();
    Navigator.of(ctx.context).pop();
  }
}

void _onChooseImg(Action action ,Context<EditDiaryState> ctx) async{
  final pickedFile = await ctx.state.picker.getImage(source: ImageSource.gallery);
  File _image = File(pickedFile.path);
  ctx.dispatch(EditDiaryActionCreator.setChooseImg(_image));
}
