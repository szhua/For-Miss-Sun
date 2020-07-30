import 'package:json_annotation/json_annotation.dart';

part 'fileresponse.g.dart';

@JsonSerializable()
class Fileresponse {
    Fileresponse();
    num status;
    String message;
    String  data;
    
    factory Fileresponse.fromJson(Map<String,dynamic> json) => _$FileresponseFromJson(json);
    Map<String, dynamic> toJson() => _$FileresponseToJson(this);
}
