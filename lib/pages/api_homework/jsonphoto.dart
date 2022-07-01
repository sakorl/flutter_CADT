import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'helper.dart';
import 'model.dart';
class Jsonphoto extends StatefulWidget {
  // const JsonplaceholderPage({Key? key}) : super(key: key);

  @override
  State<Jsonphoto> createState() => _JsonplaceholderPageState();
}

class _JsonplaceholderPageState extends State<Jsonphoto> {
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
      title: Center(child: Text("Json Photo Page")),

    );
  }

  Widget _buildBody(){
    return Container(
      alignment: Alignment.center,
      child: _buildFlutterBuilder(),

    );
  }

  Widget _buildFlutterBuilder(){
    return FutureBuilder<List<Model>>(
      future: Helper.read(),
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

  Widget _buildDisplay(List<Model>? items){
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

  Widget _buildItem(Model item){
    return Container(
      child: ListTile(

        leading: Text("${item.id}"),
        title: Text("${item.title}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold, color: Colors.blue,),),

        subtitle: Column(
          children: [
            Text("${item.albumId}"),
            Image.network("${item.url}"),
            SizedBox(height: 10,),
            Image.network("${item.thumbnailUrl}"),
          ],
        )
        // : Image.network("${item.thumbnailUrl}")

      ),
    );
  }
}
