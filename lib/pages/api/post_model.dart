import 'dart:convert';
List<PostModel> getPostMOdelList(String data){
  List list = json.decode(data);

  return list.map((e) => PostModel.fromMap(e)).toList();
}

class PostModel{
  late int userId;
  late int id;
  late String title;
  late String body;

  PostModel({
    this.userId=0,
    this.id = 0,
    this.title = "no title",
    this.body = "no body",

});

  factory PostModel.fromMap(Map<String, dynamic> map){
    return PostModel(
      userId: map['userId'],
      id: map['id'],
      title: map['title'],
      body: map['body'],
    );
  }
}