import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cherry/ArticleWidget.dart';
import 'package:flutter_cherry/modle/ArticleListParam.dart';
import 'package:flutter_cherry/modle/ArticleModle.dart';
import 'package:flutter_cherry/modle/bean/ArticleBean.dart';
import 'package:flutter_cherry/Cipher.dart';

//文章列表页面
class ArticleListPage extends StatefulWidget {
  ArticleListPage({Key key, this.type}) : super(key: key);
  final String type;

  @override
  State<StatefulWidget> createState() {
    return ArticleListState();
  }
}

class ArticleListState extends State<ArticleListPage>
    with AutomaticKeepAliveClientMixin {
  List<ArticleBean> _data = List();
  var _currentIndex = 1;

  /// 是否已加载完所有数据
  var _loadFinish = false;

  /// 是否正在加载数据
  bool isLoading = false;

  /// listView的控制器
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _getData();
  }

  //获取数据
  void _getData() async {
    ArticleListParam paramBean = new ArticleListParam('0', 1, 1);
    String params = jsonEncode(paramBean);
    print("请求的参数 ==>" + params);

    String encryptedString = await Cipher.encrypt(params);
    print("加密后的参数" + encryptedString);
//    http://xlj.szhuanww.com/web/Article/lists?content=bust26q0qlpkbur/ty/k+3uweepuefj/ghd/wexauu7g6ftb0qo5vwsznomro81f00o=
    Dio dio2 = new Dio(); // 使用默认配置
    Response response2 = await dio2.get(
        "http://hyt.szhuanww.com/web/Article/lists?content=" + encryptedString);
    if (response2.statusCode == 200) {
      print("请求结果 ==>" + response2.data.toString());
      ArticleModle modle = ArticleModle.fromJson(response2.data);
      isLoading = false;
      setState(() {
        if (modle.data.isEmpty) {
          _loadFinish = true;
        } else {
          _data.addAll(modle.data);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _data.isEmpty
            ? LoadingWidget()
            : ListView.builder(
                itemBuilder: _renderRow,
                itemCount: _loadFinish ? _data.length : _data.length + 1,
                controller: _scrollController,
              ));
  }

  Widget _renderRow(BuildContext context, int index) {
    if (index < _data.length) {
      return ShowListWidget(info: _data[index]);
    }
    return _getMoreWidget();
  }

  @override
  bool get wantKeepAlive => true;
  //加载显示更多组件
  Widget _getMoreWidget() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(
              strokeWidth: 1.0,
            )
          ],
        ),
      ),
    );
  }
}
