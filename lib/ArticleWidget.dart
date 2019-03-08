import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cherry/article/WebPage.dart';
import 'package:flutter_cherry/modle/bean/ArticleBean.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: window.physicalSize.height,
      child: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new CircularProgressIndicator(
              strokeWidth: 2,
            ),
            new Container(
              padding: EdgeInsets.only(top: 10.0),
              child: new Text("正在加载"),
            )
          ],
        ),
      ),
    );
  }
}

//文章列表
class ShowListWidget extends StatelessWidget {
  ShowListWidget({Key key, this.info, this.contexts}) : super(key: key);
  final ArticleBean info;
  final BuildContext contexts;

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new GestureDetector(
        onTap: () {
          //导航到新路由
          Navigator.push(contexts == null ? context : contexts,
              new MaterialPageRoute(builder: (context) {
            return new WebPage();
          }));
        },
        child: new Card(
          child: new Padding(
            padding: const EdgeInsets.all(10.0),
            child: _getRowWidget(),
          ),
          elevation: 3.0,
          margin: const EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 6.0),
        ),
      ),
    );
  }

  Widget _getRowWidget() {
    return new Column(
      children: <Widget>[
        new Row(
          children: <Widget>[
            new Expanded(
                child: new Text(
              info.title,
              maxLines: 3,
              style: new TextStyle(fontSize: 16.0),
            )),
                info.cover_picture == null || info.cover_picture.isEmpty ? new Text("") : new Container(
                    margin: EdgeInsets.only(left: 8.0),
                    child: new CachedNetworkImage(
                      placeholder: Image(
                        image: AssetImage('img/a8b.png'),
                        fit: BoxFit.cover,
                        width: 90,
                        height: 90,
                      ),
                      fit: BoxFit.fitWidth,
                      imageUrl: info.cover_picture,
                      width: 90,
                      height: 90,
                    ),
                  )
          ],
        ),
        new Container(
          margin: EdgeInsets.only(top: 8.0),
          child: new Row(
            children: <Widget>[
              new Expanded(
                  child: new Text(
                '分享单价：' + info.money_view_user,
                style: new TextStyle(color: Color(0xFF888888), fontSize: 12.0),
              )),
              new Text(
                '阅读数：' + info.fake_view_max.toString(),
                style: new TextStyle(color: Color(0xFF888888), fontSize: 12.0),
              )
            ],
          ),
        )
      ],
    );
  }
}
