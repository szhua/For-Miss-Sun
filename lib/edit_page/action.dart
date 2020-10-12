
import 'dart:io';

import 'package:fish_redux/fish_redux.dart';
import 'package:for_miss_sun/models/diary.dart';
import 'package:image_picker/image_picker.dart';

enum EditDiaryAction { onSaveDiary , saveDiary , onChooseImg , setChooseImg}

class EditDiaryActionCreator {

  static Action saveDiary(Diary diary) {
    return  Action(EditDiaryAction.saveDiary,payload: diary);
  }

  static Action onSaveDiary() {
    return  Action(EditDiaryAction.onSaveDiary);
  }
  static Action onChooseImg(){
    return Action(EditDiaryAction.onChooseImg);
  }
  static Action setChooseImg(File file){
    return Action(EditDiaryAction.setChooseImg,payload: file);
  }
}
