import 'package:for_miss_sun/models/diary.dart';
import 'package:data_plugin/bmob/bmob.dart';
import 'package:data_plugin/bmob/table/bmob_object.dart';

diaryFromJson(Diary data, Map<String, dynamic> json) {
	if (json['objectId'] != null) {
		data.objectId = json['objectId']?.toString();
	}
	if (json['content'] != null) {
		data.content = json['content']?.toString();
	}
	if (json['dary_img'] != null) {
		data.dary_img = json['dary_img']?.toString();
	}
	if (json['createdAt'] != null) {
		data.createdAt = json['createdAt']?.toString();
	}
	if (json['updateAt'] != null) {
		data.updateAt = json['updateAt']?.toString();
	}
	if (json['name'] != null) {
		data.name = json['name']?.toString();
	}
	return data;
}

Map<String, dynamic> diaryToJson(Diary entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['objectId'] = entity.objectId;
	data['content'] = entity.content;
	data['dary_img'] = entity.dary_img;
	data['createdAt'] = entity.createdAt;
	data['updateAt'] = entity.updateAt;
	data['name'] = entity.name;
	return data;
}