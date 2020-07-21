import 'package:json_annotation/json_annotation.dart';

part 'diary.g.dart';

@JsonSerializable()
class Diary {
    Diary();

    String objectId;
    String content;
    String dary_img;
    String createdAt;
    String updateAt;
    String ACL;
    String name ;

    
    factory Diary.fromJson(Map<String,dynamic> json) => _$DiaryFromJson(json);
    Map<String, dynamic> toJson() => _$DiaryToJson(this);
}
