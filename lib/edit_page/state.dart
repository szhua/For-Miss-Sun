import 'dart:io';

import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:for_miss_sun/models/index.dart';
import 'package:image_picker/image_picker.dart';

class EditDiaryState implements Cloneable<EditDiaryState> {
  TextEditingController contentEditController;
  FocusNode focusNode;
  File image;
  Diary diary;
  ImagePicker picker = ImagePicker();


  @override
  EditDiaryState clone() {
    return EditDiaryState()
      ..contentEditController = contentEditController
      ..focusNode=focusNode
      ..picker =picker
      ..image =image
      ..diary = diary;
  }
}

EditDiaryState initState(Map<String, dynamic> args) {
  return EditDiaryState()
    ..contentEditController = TextEditingController()
    ..focusNode =new FocusNode()
    ..diary = new Diary();
}
