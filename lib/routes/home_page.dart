import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:for_miss_sun/common/index.dart';
import 'package:for_miss_sun/models/index.dart';
import 'package:for_miss_sun/widgets/index.dart';
import 'package:oktoast/oktoast.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
    latestOne = await BombApi(context).getLatestOne();
    setState(() {});
    //Navigator.of(context).pop();
  }



  @override
  void initState() {
    super.initState();
    bus.on('refreshHome', (arg) {
      _getLatestOne();
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(child:
    Scaffold(
        floatingActionButton: FloatingActionButton(
          mini: true,
          child: IconButton(
            onPressed: navToAdd,
            icon: Icon(Icons.keyboard,color: Colors.white,),
          ),
        ),
        appBar: MyAppBar(
          widget.title,
          leading: GestureDetector(
            onTap:(){},
            child: Text(''),
          ),
          centerTitle: true,
          actions: <Widget>[
            GestureDetector(
              onTap: actionPress,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 12),
                child: Icon(
                  Icons.library_books,
                  color: Colors.white,
                ),
              ),
            )
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
        )),
        onWillPop: existSystem);
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
