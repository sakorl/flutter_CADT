import 'package:flutter/material.dart';
import 'package:test2/helper/my_login.dart';

class Md5 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    MyLogin myLogin = MyLogin();
    myLogin.password=("abc");
    print(myLogin.hash);

    return MaterialApp(
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  //const MyHome({Key? key}) : super(key: key);
  TextEditingController _textCtrl = TextEditingController();

  String text = "";

  @override
  Widget build(BuildContext context) {

    MyLogin login = MyLogin();

    return Scaffold(
      appBar: AppBar(title: Text("Hello App"),),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _textCtrl,
            ),
            ElevatedButton(child: Text("Convert"),onPressed: (){
              login.password = _textCtrl.text;
              setState(() {
                text = login.hash;
              });
            }),
            Text("$text"),
          ],
        ),
      ),
    );
  }
}