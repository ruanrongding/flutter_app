import 'package:flutter/material.dart';
import 'package:flutter_html_view/flutter_html_view.dart';
import 'package:share/share.dart';

//页面展示
class WebPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {return WebPageState();}
}

class WebPageState extends State<WebPage> {
  String html = "<p>（<span style=\"color: rgb(255, 0, 0);\"><strong>2019年1月21号 之后更新过的请 忽略 本文</strong></span>）</p><p><br/></p><p>鉴于仍有部分用户无法下载小辣椒更新，我们特意推出本文更新包下载地址，老APP还是有部分朋友圈分享不可见，避免影响大家收益，请大家尽快更新新包，此次老用户覆盖更新自动赠送现金红包，赶紧来领取拉。</p><p><br/></p><p>\r\n    （不会截图和复制链接的，分享这篇文章到微信里面就可以正常去更新了）\r\n</p><p>下载更新方式：</p><p><br/></p><p>1， 最新安装包下载地址：<a href=\"http://t.cn/EGUT7MU\" target=\"_blank\">http://t.cn/EGUT7MU</a>（复制链接到浏览器打开下载）</p><p><br/></p><p>2， 截图保存以下二维码图片，用微信或浏览器识别二维码下载</p><p><br/></p><p><img src=\"http://wx3.sinaimg.cn/mw690/bbb6c919gy1fzmaomdtfzj2078078a9t.jpg\"/></p><p><br/></p><p>如果更新下载遇到问题，请联系平台客服：</p><p><br/></p><p>微信：keke215825</p><p><br/></p><p>QQ：1972488464</p><p><br/></p>";

  IconData _backIcon() {
    switch (Theme.of(context).platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return Icons.arrow_back;
      case TargetPlatform.iOS:
        return Icons.arrow_back_ios;
    }
    assert(false);
    return null;
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '网页',
      home: new Scaffold(
        appBar: AppBar(
          title: const Text('红樱桃'),
          centerTitle: true,
          leading: Builder(builder: (BuildContext cotext) {
            return IconButton(
              icon: Icon(_backIcon()),
              onPressed: () {
                Navigator.pop(context);
              },
            );
          }),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.share),
              onPressed: () {
                Share.share('check out my website https://example.com');
//                FlutterShareMe().shareToSystem(
//                    msg:
//                        'hello,this is my github:https://github.com/lizhuoyuan');
              },
            )
          ],
        ),
        body: new Center(
          child: new HtmlView(
            data: html,
          ),
        ),
      ),
    );
  }
}
