import 'package:data_plugin/bmob/table/bmob_object.dart';

class diary extends BmobObject{
  @override
  Map getParams() {
    Map<String, dynamic> data = new Map();
    data['objectId']=objectId;
    return data ;
  }
}