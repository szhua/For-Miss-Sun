import 'package:fish_redux/fish_redux.dart';

//TODO replace with your own action
enum SloganAction { setCurrentImg }

class SloganActionCreator {
  static Action setCurrentImg(String imgPath) {
    return  Action(SloganAction.setCurrentImg,payload: imgPath);
  }
}
