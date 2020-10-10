import 'package:for_miss_sun/models/fileresponse.dart';
import 'package:json_annotation/json_annotation.dart';

fileResponseFromJson(FileResponse data, Map<String, dynamic> json) {
	if (json['status'] != null) {
		data.status = json['status']?.toInt();
	}
	if (json['message'] != null) {
		data.message = json['message']?.toString();
	}
	if (json['data'] != null) {
		data.data = json['data']?.toString();
	}
	return data;
}

Map<String, dynamic> fileResponseToJson(FileResponse entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['status'] = entity.status;
	data['message'] = entity.message;
	data['data'] = entity.data;
	return data;
}