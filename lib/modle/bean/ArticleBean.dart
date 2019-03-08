class ArticleBean {
  int article_id;
  int category_id;
  String title;
  String cover_picture;
  int view_count;
  int content_type;
  String money_view_user;
  int fake_view_max;
  String title_end;
  String fake_view_begin;

  //{article_id:210456,
  // category_id: 44,
  // title: 红樱桃请分享到微信点击下载更新,免得没收益(本文不计费),
  // cover_picture: http://wx4.sinaimg.cn/mw690/bbb6c919gy1fzmawyxfdaj2078078a9t.jpg,
  // view_count: 416,
  // content_type: 1,
  // money_view_user: 0.000,
  // fake_view_max: 49171,
  // title_end: ,
  // fake_view_begin: 2019-01-27 09:36:04}

  ArticleBean.fromJson(jsonRes) {
    print('ArticleBean data ==>' + jsonRes.toString());
    article_id = jsonRes['article_id'];
    category_id = jsonRes['category_id'];
    title = jsonRes['title'];
    cover_picture = jsonRes['cover_picture'];
    view_count = jsonRes['view_count'];
    content_type = jsonRes['content_type'];
    money_view_user = jsonRes['money_view_user'];
    fake_view_max = jsonRes['fake_view_max'];
    title_end = jsonRes['title_end'];
    fake_view_begin = jsonRes['fake_view_begin'];
  }

  ArticleBean(
      this.article_id,
      this.category_id,
      this.title,
      this.cover_picture,
      this.view_count,
      this.content_type,
      this.money_view_user,
      this.fake_view_max,
      this.title_end,
      this.fake_view_begin
      );

  @override
  String toString() {
    return 'ArticleBean{article_id: $article_id, category_id: $category_id,'
        ' title: $title, cover_picture: $cover_picture, view_count: $view_count,'
        ' content_type: $content_type, money_view_user: $money_view_user, '
        'fake_view_max: $fake_view_max, title_end: $title_end, fake_view_begin: $fake_view_begin}';
  }
}
