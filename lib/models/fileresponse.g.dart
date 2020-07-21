// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fileresponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Fileresponse _$FileresponseFromJson(Map<String, dynamic> json) {
  return Fileresponse()
    ..status = json['status'] as num
    ..message = json['message'] as String
    ..data = json['data'] as Map<String, dynamic>;
}

Map<String, dynamic> _$FileresponseToJson(Fileresponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data
    };
