class ArticleTitleModle {
  int category_id;
  String name;

  ArticleTitleModle(id, name) {
    this.category_id = id;
    this.name = name;
  }
  ArticleTitleModle.fromJson(jsonRes){
    category_id = jsonRes['category_id'];
    name = jsonRes['name'];
  }

  @override
  String toString() {
    return 'ArticleTitleModle{category_id: $category_id, name: $name}';
  }


}
