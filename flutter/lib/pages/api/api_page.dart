import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ApiPage extends StatefulWidget {
  const ApiPage({Key? key}) : super(key: key);

  @override
  State<ApiPage> createState() => _ApiPageState();
}

class _ApiPageState extends State<ApiPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text("API Page"),
    );
  }

  Widget _buildBody() {
    return Container(
      alignment: Alignment.center,
      child: _buildFutureBuilder(),
    );
  }

  Future<String> _getData() async {
    try{
      http.Response response = await http.get(Uri.parse("https://pub.dev/"));
      if(response.statusCode == 200){
        return response.body;
      }
      else{
        return "Something went wrong";
      }
    } catch(e){
      return "Something went wrong";
      // return e.toString(); //for debug
    }
  }

  Widget _buildFutureBuilder() {
    return FutureBuilder<String>(
      future: _getData(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return _buildDisplay(snapshot.data);
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  Widget _buildDisplay(String? data) {
    if (data == null) {
      return Icon(Icons.error);
    } else {
      return SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Text(
            data,
            style: TextStyle(fontSize: 20),
          ),
        ),
      );
    }
  }
}

