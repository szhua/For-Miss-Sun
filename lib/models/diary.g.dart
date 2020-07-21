// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'diary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Diary _$DiaryFromJson(Map<String, dynamic> json) {
  return Diary()
    ..objectId = json['objectId'] as String
    ..content = json['content'] as String
    ..dary_img = json['dary_img'] as String
    ..createdAt = json['createdAt'] as String
    ..updateAt = json['updateAt'] as String
    ..ACL = json['ACL'] as String
  ..name =json['name'] as String;
}

Map<String, dynamic> _$DiaryToJson(Diary instance) => <String, dynamic>{
      'objectId': instance.objectId,
      'content': instance.content,
      'dary_img': instance.dary_img,
      'createdAt': instance.createdAt,
      'updateAt': instance.updateAt,
      'ACL': instance.ACL,
       'name':instance.name,
    };
