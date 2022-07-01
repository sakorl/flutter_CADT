import 'dart:convert';
List<Model> getPostMOdelList(String data){
  List list = json.decode(data);

  return list.map((e) => Model.fromMap(e)).toList();
}

class Model{
  late int albumId;
  late int id;
  late String title;
  late String url;
  late String thumbnailUrl;

  Model({
    this.albumId=0,
    this.id = 0,
    this.title = "no title",
    this.url = "no url",
    this.thumbnailUrl = "no thumbnailUrl",

  });

  factory Model.fromMap(Map<String, dynamic> map){
    return Model(
      albumId: map['albumId'],
      id: map['id'],
      title: map['title'],
      url: map['url'],
      thumbnailUrl: map['thumbnailUrl'],
    );
  }
}