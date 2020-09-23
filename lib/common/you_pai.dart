import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:for_miss_sun/models/index.dart';

class YouPai {

  YouPai([this.context]) {
    _options = Options(extra: {'context': context});
  }

  BuildContext context;
  Options _options;

  static Dio dio =
  new Dio(BaseOptions(baseUrl: 'http://114.215.124.170:8087', headers: {

  }));

  static void init() {

  }

  Future<Fileresponse> uploadFile(File file) async{
     var postData = FormData.fromMap({
       "file": await MultipartFile.fromFile(file.path)
     });
     var r =  await dio.post('/s-file/addPhoto',data: postData);
     return  Fileresponse.fromJson(r.data);
  }


}
