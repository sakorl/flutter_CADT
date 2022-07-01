import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class RowColum extends StatefulWidget {
  const RowColum({Key? key}) : super(key: key);

  @override
  State<RowColum> createState() => _RowColumState();
}

class _RowColumState extends State<RowColum> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar,
      body: _buildBody,
    );
  }
}

AppBar get _buildAppBar{
  return AppBar(
    backgroundColor: Colors.blue,
    title: _buildAppBarMenu2,
    // Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //   children: [
    //     InkWell(child: Text("Movies"), onTap: (){},),
    //     InkWell(child: Text("Latest"), onTap: (){},),
    //     InkWell(child: Text("Trends"), onTap: (){},),
    //     IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz)),
    //   ],
    // ),

  );
}

Widget get _buildBody{
  return Container(
    alignment: Alignment.center,
    child: _buildColumn,
  );
}

Widget get _buildColumn{
  return Container(
    color: Colors.brown.withOpacity(0.5),
    child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(width: 150, height: 400,color: Colors.blue,),
          Container(width: 110, height: 50,color: Colors.red,),
          Container(width: 150, height: 80,color: Colors.pink,),
          Container(width: 80, height: 50,color: Colors.grey,),
          Container(width: 150, height: 70,color: Colors.black,),
          Container(width: 100, height: 50,color: Colors.purple,),

        ],
      ),
    ),
  );
}

Widget get _buildRowBody{
  return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // children: [
      //   InkWell(child: Text("Movies"), onTap: (){},),
      //   InkWell(child: Text("Latest"), onTap: (){},),
      //   InkWell(child: Text("Trends"), onTap: (){},),
      //   IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz)),
      // ],

    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Container(width: 10, height: 60,color: Colors.blue,),
      Container(width: 20, height: 50,color: Colors.red,),
      Container(width: 30, height: 40,color: Colors.pink,),
      Container(width: 40, height: 30,color: Colors.grey,),
      Container(width: 50, height: 20,color: Colors.black,),
      Container(width: 70, height: 10,color: Colors.purple,),

    ],
  );
}

Widget get _buildAppBarMenu2{
  return Row(
    children: [
      InkWell(child: Text("Movies"), onTap: (){},),
      SizedBox(width: 10,),
      InkWell(child: Text("Latest"), onTap: (){},),
      SizedBox(width: 10,),
      InkWell(child: Text("Trends"), onTap: (){},),
      Spacer(),
      IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.instagram)),
      IconButton(onPressed: (){}, icon: Icon(FontAwesomeIcons.share)),
    ],
  );
}