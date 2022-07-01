import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test2/pages/api/post_helper.dart';
import 'package:test2/pages/api/post_model.dart';
class JsonplaceholderPage extends StatefulWidget {
  const JsonplaceholderPage({Key? key}) : super(key: key);

  @override
  State<JsonplaceholderPage> createState() => _JsonplaceholderPageState();
}

class _JsonplaceholderPageState extends State<JsonplaceholderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }
  AppBar _buildAppBar(){
    return AppBar(
      backgroundColor: Colors.blue,
      title: Text("Json Placeholder Page"),

    );
  }

  Widget _buildBody(){
    return Container(
      alignment: Alignment.center,
      child: _buildFlutterBuilder(),

    );
  }

  Widget _buildFlutterBuilder(){
    return FutureBuilder<List<PostModel>>(
      future: PostHelper.read(),
      builder: (context,snapshot){
        if (snapshot.hasError){
          return Text(snapshot.error.toString());
        }

        if (snapshot.connectionState == ConnectionState.done){
          return _buildDisplay(snapshot.data);
        } else{
          return CircularProgressIndicator();
        }
      },
    );
  }

  Widget _buildDisplay(List<PostModel>? items){
    if (items == null){
      return Icon(Icons.error);
    }

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index){
        return _buildItem(items[index]);
      },
    );
  }

  Widget _buildItem(PostModel item){
    return Card(
      child: ListTile(
        leading: Text("${item.id}"),
        title: Text("${item.title}"),
        subtitle: Text("${item.body}"),
        trailing: Text("${item.userId}"),

      ),
    );
  }
}
