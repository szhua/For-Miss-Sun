import 'package:for_miss_sun/generated/json/base/json_convert_content.dart';
import 'package:json_annotation/json_annotation.dart';


class FileResponse with JsonConvert<FileResponse> {

    int status;
    String message;
    String data;
    

}
