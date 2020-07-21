import 'dart:io';

import 'package:flutter/material.dart';
import 'package:for_miss_sun/common/index.dart';
import 'package:for_miss_sun/models/diary.dart';
import 'package:for_miss_sun/widgets/index.dart';
import 'package:image_picker/image_picker.dart';
import 'package:oktoast/oktoast.dart';

class AddDiaryRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AddDiaryState();
}

class AddDiaryState extends State<AddDiaryRoute> {
  final TextStyle normalStyle = TextStyle(fontFamily: "Lei",fontSize: 20);

  File _image;
  final picker = ImagePicker();
  chooseImg() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedFile.path);
    });
  }

  saveDiary() async {
    if(contentEditController.text == null||contentEditController.text.isEmpty){
        showToast('内容不能为空');
        return ;
    }
    if(_image==null){
      showToast('图片必须上传');
      return ;
    }
    showLoading(context);
    var fileResponse =  await YouPai(context) .uploadFile(_image);
    if(fileResponse.status ==100) {
      String filePath = 'http://image-szhua.test.upcdn.net${fileResponse
          .data['url']}';
      String content = contentEditController.text;
      var  diary = await BombApi(context).insertOneDiary(Diary()..content=content..dary_img=filePath);
      if(diary!=null){
        showToast('上传成功');
        focusNode.unfocus();
        bus.emit('refreshHome', {});
        Navigator.of(context).pop();
        Navigator.of(context).pop();
      }else{
        showToast('上传失败');
        focusNode.unfocus();
        Navigator.of(context).pop();
      }
    }else{
      showToast('上传图片失败');
      focusNode.unfocus();
      Navigator.of(context).pop();
    }

  }

  Widget buildImg() {
    if (_image != null) {
      return Card(
        margin: EdgeInsets.all(4),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          child: Image.file(
            _image,
            fit: BoxFit.cover,
          ),
        ),
      );
    } else {
      return Center(
        child: Text(
          '添加图片',
          style: normalStyle,
        ),
      );
    }
  }

  TextEditingController contentEditController = TextEditingController();
  FocusNode focusNode = new FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
          '添加',
          actions: <Widget>[
            GestureDetector(
              onTap: saveDiary,
              child: Icon(
                Icons.check,
                color: Colors.white,
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: chooseImg,
          child: Icon(
            Icons.add_a_photo,
            color: Colors.white,
          ),
        ),
        body: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Center(
            child: ListView(
              children: <Widget>[
                DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(3.0), //3像素圆角
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      focusNode: focusNode,
                      controller: contentEditController,
                      autofocus: false,
                      maxLength: 500,
                      maxLines: 8,
                      style: TextStyle(fontSize: 19, fontFamily: 'Lei'),
                      decoration: InputDecoration(
                          hintText: '输入今日你想说的话吧!',
                          hintStyle:
                          TextStyle(color: Colors.grey, fontFamily: 'Lei'),
                          border: InputBorder.none),
                    ),
                  ),
                ),
                AspectRatio(
                  aspectRatio: 1000 / 618,
                  child: Card(
                    child: buildImg(),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
