
class ArticleListParam {
  String catid;
  int page;
  int channel;
  ArticleListParam(this.catid, this.page, this.channel);

  Map<String, dynamic> toJson() =>
      {
        'catid': catid,
        'page': page,
        'channel': channel,
      };


}
