import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:for_miss_sun/common/index.dart';
import 'package:for_miss_sun/models/index.dart';
import 'package:for_miss_sun/widgets/index.dart';
import 'package:oktoast/oktoast.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key key,this.arguments=''}) : super(key: key){
    print(this.arguments);
  }
  final   arguments;
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  void actionPress() {
    Navigator.of(context).pushNamed('for_you_list');
  }

  void navToAdd() {
    Navigator.of(context).pushNamed('add_diary');
  }

  Diary latestOne;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _getLatestOne();
  }

  void _getLatestOne() async {
//    Future.delayed(Duration.zero,(){
//      showLoading(context);
//    });
    print(widget.arguments['objectId'].toString());
   latestOne = await BombApi(context).getOne(widget.arguments['objectId']);
    setState(() {});
    //Navigator.of(context).pop();
  }



  @override
  void initState() {
    super.initState();
    print('wwwwwwwww');
    print(widget.arguments);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
          'ForYou',
          leading: GestureDetector(
            onTap:(){},
            child: Text(''),
          ),
          centerTitle: true,
          actions: <Widget>[

          ],
        ),
        body: SingleChildScrollView(
          child: Center(
              child: Container(
                child: Card(
                  margin: EdgeInsets.all(20),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Container(
                      constraints: BoxConstraints(minHeight: 300),
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: Column(
                        children: <Widget>[_buildContent()],
                      ),
                    ),
                  ),
                ),
              )),
        ));
  }

  DateTime _lastPressedAt; //上次点击时间
  Future<bool> existSystem() async{
    if (_lastPressedAt == null ||DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)) {
      //两次点击间隔超过1秒则重新计时
      _lastPressedAt = DateTime.now();
      showToast('再按一次退出程序',position: ToastPosition.bottom);
      return false;
    }
    await SystemNavigator.pop();
    return false;
  }

  Widget buildImage() {
    if (latestOne.dary_img != null && !latestOne.dary_img.isEmpty) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Image(
          image: NetworkImage(latestOne.dary_img),
          width: double.infinity,
          height: 200,
          fit: BoxFit.cover,
        ),
      );
    } else {
      return Offstage(
        offstage: true,
        child: Container(),
      );
    }
  }

  _buildContent() {
    if (latestOne != null) {
      return Column(
        children: <Widget>[
          buildImage(),
          Text(
            latestOne.content,
            style: TextStyle(fontFamily: 'Lei', fontSize: 19),
          )
        ],
      );
    } else {
      return Container();
    }
  }
}
