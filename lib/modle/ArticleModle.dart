import 'package:flutter_cherry/modle/bean/ArticleBean.dart';

//文章列表信息
class ArticleModle {
  int status;
  String money;
  int a_type;
  int g_type;
  String a_title;
  String g_title;
  String a_money;
  String g_money;
  String fake_view_begin;
  List<ArticleBean> data;

  ArticleModle.fromJson(jsonRes) {
    status = jsonRes['status'];
    money = jsonRes['money'];
    a_type = jsonRes['a_type'];
    g_type = jsonRes['g_type'];
    a_title = jsonRes['a_title'];
    g_title = jsonRes['g_title'];
    a_money = jsonRes['a_money'];
    g_money = jsonRes['g_money'];
    fake_view_begin = jsonRes['fake_view_begin'];

    List moduleData = jsonRes['data'];
    data = new List();
    moduleData.forEach((item) {
      data.add(ArticleBean.fromJson(item));
    });
  }
}
