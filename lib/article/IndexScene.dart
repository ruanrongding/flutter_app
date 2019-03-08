import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cherry/article/ArticleListPage.dart';
import 'package:flutter_cherry/modle/ArticleTitleModle.dart';

List<ArticleTitleModle> _allPages = new List<ArticleTitleModle>();

class IndexScene extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return IndexSceneState();
  }
}

class IndexSceneState extends State<IndexScene>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  TabController _controller;

  IndexSceneState() {
    _getTabList();
  }

  //获取网络数据
  void _getTabList() async {
    List<ArticleTitleModle> list = await _articleTitleList();
    _controller = TabController(length: _allPages.length, vsync: this);
    setState(() {
      _allPages = list;
    });
  }

  Future<List<ArticleTitleModle>> _articleTitleList() async {
    Dio dio = new Dio(); // 使用默认配置
    Response response =
        await dio.get("http://hyt.szhuanww.com/web/Article/index");
    List<ArticleTitleModle> mList = new List<ArticleTitleModle>();
    if (response.statusCode == 200) {
      //表示请求数据成功
      List moduleData = response.data['data'];
      moduleData.forEach((data) {
        print('data ==>' + data.toString());
        mList.add(ArticleTitleModle.fromJson(data));
      });
      return mList;
    } else {
      return mList;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: _allPages.length, vsync: this);
    print("initState()");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print("dispose()");
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('build()');
    return Scaffold(
      appBar: AppBar(
        title: const Text('红樱桃'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              setState(() {
                //搜索
              });
            },
          )
        ],
        bottom: TabBar(
          controller: _controller,
          isScrollable: true,
          tabs: _allPages
              .map<Tab>(
                (ArticleTitleModle page) => Tab(text: page.name),)
              .toList(),
        ),
      ),
      body: TabBarView(
          controller: _controller,
          children: _allPages.map<Widget>((ArticleTitleModle page) {
            return new ArticleListPage(type: page.category_id.toString());
          }).toList()),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
