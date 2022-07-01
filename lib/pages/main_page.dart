import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar,
      body: _buildBody,
      bottomNavigationBar: _buildBottom,
      floatingActionButton: _buildFloat,
      

    );
  }
}

AppBar get _buildAppBar{
  return AppBar(

    title: InkWell(
      child: Text("សួស្ដី", style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        fontFamily: "KhmerOSsiemreap",

      ),),onTap: (){print("You");},
    ),
    centerTitle: true,
    backgroundColor: Colors.red,

    leading: IconButton(icon: Icon(FontAwesomeIcons.share), onPressed: (){
      print("People clicked");
    }, ),
    actions: [
      IconButton(onPressed: (){print("People clicked");}, icon: Icon(Icons.people)),
      IconButton(onPressed: (){print("People clicked");}, icon: Icon(Icons.share)),
    ],
  );
}
Widget get _buildBody{
   // String s1 = "https://m.media-amazon.com/images/M/MV5BZWMyYzFjYTYtNTRjYi00OGExLWE2YzgtOGRmYjAxZTU3NzBiXkEyXkFqcGdeQXVyMzQ0MzA0NTM@._V1_FMjpg_UX1000_.jpg";
  // String s2 = "https://image.api.playstation.com/vulcan/img/rnd/202011/0714/vuF88yWPSnDfmFJVTyNJpVwW.png";
  // return Container(
  //   padding: EdgeInsets.all(15),
  //     alignment: Alignment.center,
  //   child: Image.asset("assets/images/img.png"),
  // );

  return Container(
    alignment: Alignment.center,
    // child: _buildButton,
     child: _buildCircle,
    // child: _buildImageCircle,
  );
}

Widget get _buildCircle{
  return Container(
    width: 150,
    height: 150,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomRight,
        stops: [0.45,.55],
          colors: [
        Colors.blue,
        Colors.black12
      ]),
    ),

  );
}

Widget get _buildButton{
  return Container(
    child: Text("LOVE!", style: TextStyle(fontSize: 40),),
    padding: EdgeInsets.only(top: 30,bottom: 30,left: 20,right: 20),
    decoration: BoxDecoration(
      color: Colors.red,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [BoxShadow(
        color: Colors.blue,
        offset: Offset(3,3),
        blurRadius: 3,
        spreadRadius: 3,
      )],
    ),
  );
}

Widget get _buildImageCircle{
  return Container(
    width: 250,
    height: 250,
    decoration: BoxDecoration(
      // color: Colors.orange,
      shape: BoxShape.circle,
      image: DecorationImage(
        image: AssetImage("assets/images/img.png"),
        alignment: Alignment.topCenter,
        fit: BoxFit.cover,
      ),
    ),
  );
}

Widget get _buildBottom{
  return BottomAppBar(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        IconButton(onPressed: (){}, icon: Icon(Icons.home_outlined)),
        IconButton(onPressed: (){}, icon: Icon(Icons.group_add)),
        IconButton(onPressed: (){}, icon: Icon(Icons.play_arrow)),
        IconButton(onPressed: (){}, icon: Icon(Icons.people)),
        IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz)),
      ],
    ),
  );
}

Widget get _buildFloat{
  return FloatingActionButton(
      child: Icon(Icons.mail_outlined),
      onPressed: (){});
}

