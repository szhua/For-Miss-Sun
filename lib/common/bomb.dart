import 'dart:io';

import 'package:data_plugin/bmob/bmob_query.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:for_miss_sun/models/index.dart';

class BombApi {

  static String appkey = '9978d3967eb2807caca03e23d5adbb96';
  static String apiKey = 'e90ca06ac042fe14fedccfd7fdbb7a78';

  BombApi([this.context]) {
    _options = Options(extra: {'context': context});
  }

  BuildContext context;
  Options _options;

  static Dio dio = new Dio(BaseOptions(baseUrl: 'https://api2.bmob.cn/1/classes', headers: {
    'X-Bmob-Application-Id': appkey,
    'X-Bmob-REST-API-Key': apiKey,
  }));

  static void init() {}



  Future<Diary> insertOneDiary(Diary diary) async {
    _options.headers[HttpHeaders.contentTypeHeader] = 'application/json';
    var r = await dio.post('/diary/', options: _options, data: {
      'content':diary.content,
      'dary_img':diary.dary_img
    });
    return Diary().fromJson(r.data);
  }

  Future<Diary> getOne(String id ) async{
    BmobQuery query =new BmobQuery();
    var r = await query.queryObjectByTableName(id,'diary');
    return Diary().fromJson(r);
  }


  Future<Diary> getLatestOne() async{
     BmobQuery query =new BmobQuery();
     query.order='-createdAt';
     query.limit=1;
     var r = await query.queryObjectsByTableName('diary');
     return r.map((e) => Diary().fromJson(e)).toList().first;
  }

  Future<List<Diary>> getPageData({int page = 1,int count = 10} )async{
    BmobQuery query =new BmobQuery();
    query.order='-createdAt';
    query.limit =count;
    query.skip = (page-1)*count;
    var r = await query.queryObjectsByTableName('diary');
    return r.map((e) => Diary().fromJson(e)).toList();
  }

  ///查询一条数据
  Future<List<Diary>> querySingle() async {
    BmobQuery query = BmobQuery();
    var r = await query.queryObjectsByTableName('diary');
    return r.map((e) => Diary().fromJson(e)).toList();
  }
}
