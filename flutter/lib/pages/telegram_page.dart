import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TelegramPage extends StatefulWidget {
  const TelegramPage({Key? key}) : super(key: key);

  @override
  State<TelegramPage> createState() => _TelegramPageState();
}

class _TelegramPageState extends State<TelegramPage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }
  bool _dark = false;

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: _dark ? Colors.black:Colors.grey[200],
      title: Column(
          children: [
            Center(
              child: Text(
                "Mobile Programming",
                style: TextStyle(color: _dark ? Colors.white:Colors.black, fontSize: 15),
              ),
            ),
            Text(
              "27 members",
              style: TextStyle(color: _dark ? Colors.white:Colors.black, fontSize: 14.0),
            ),
          ]
      ),

       leading: Row(
         children: [

           IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_ios_outlined), color: _dark ? Colors.white:Colors.black,),
         //  Text('30',style: TextStyle(color: _dark ? Colors.white:Colors.black,),),
           // IconButton(onPressed: (){}, icon: Icon(Icons.nat)),
         ],
       ),
      actions: [

        IconButton(onPressed: (){
          setState((){
            _dark = !_dark;
          });
        }, icon: Icon(Icons.dark_mode)),
        _buildImageCircle,
      ],
      //



    );
  }

  Widget _buildBody() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: [
          Expanded(
              child: SingleChildScrollView(
                child: _buildMessageListView(),
              )
          ),
          _buildTextBoxes(),
        ],
      ),
    );
  }

  Widget get _buildImageCircle{
    return Container(
      margin: EdgeInsets.only(
        right: 15,
      ),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        // color: Colors.orange,
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage("https://pbs.twimg.com/profile_images/1187814172307800064/MhnwJbxw_400x400.jpg"),
          alignment: Alignment.topCenter,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildMessageListView(){ //your work!
    return Container(
      width: double.maxFinite,
      // color: Colors.red,
      // color: Colors.grey,
      color: _dark ? Colors.black : Colors.grey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _leftSide,
            _rightSide,
            _leftSide,

          ],
        ),
      ),

    );
  }

  Widget get _leftSide{
    return Container(
      alignment: Alignment.topLeft,
      width: double.maxFinite,
      // color: Colors.grey,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(

              width: 250,
              height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/images/spiderman.webp",
                      ),
                      fit: BoxFit.cover
                  )
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: _buildDocL,
              width: 240,height: 110,),

            Container(
              padding: EdgeInsets.all(10),
              child: _buildTextL,
            ),
          ],
        ),
      ),

    );
  }

  Widget get _rightSide{
    return Container(
      alignment: Alignment.topRight,
      width: double.maxFinite,
      // color: Colors.grey,
      child: SingleChildScrollView(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: _buildDocR,
              width: 300,height: 110,),
            // Container(
            //   width:250,
            //   height: 300,
            //   decoration: BoxDecoration(
            //       image: DecorationImage(
            //           image: NetworkImage(
            //               "https://images.unsplash.com/photo-1579202673506-ca3ce28943ef"
            //           ),
            //           fit: BoxFit.cover
            //       )
            //   ),
            // ),
            Container(
              padding: EdgeInsets.all(10),
              child: _buildTextR,
            ),
            // SizedBox(height: 20,),



          ],
        ),
      ),

    );
  }

  Widget get _buildDocR{
    return Container(
      child: Row(
        children: [
          IconButton(onPressed: (){}, icon: Icon(Icons.file_copy_outlined),color: Colors.white,),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("my_row_column_page.dart",style: TextStyle(color: Colors.white,fontSize: 18),),
              Text("6 KB" ,style: TextStyle(color: Colors.white)),
            ],
          )
        ],
      ),
      width: 300,height:100,
      decoration: BoxDecoration(
        color: Colors.blue,
        // color: Colors.orange,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
    );
  }

  Widget get _buildDocL{
    return Container(
      child: Row(
        children: [
          IconButton(onPressed: (){}, icon: Icon(Icons.file_copy_outlined),color: Colors.white,),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("telegram_page.dart",style: TextStyle(color: Colors.white,fontSize: 18),),
              Text("10 KB" ,style: TextStyle(color: Colors.white)),
            ],
          )
        ],
      ),
      width: 240,height:100,
      decoration: BoxDecoration(
        color: Colors.blue,
        // color: Colors.orange,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20),
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),
        ),
      ),
    );
  }

  Widget get _buildTextR{

    return Container(
      child: Center(child: Text("Let's resume class at 3:30", style: TextStyle(color: Colors.white, fontSize: 20),)),
      width: 300,height:50,
      decoration: BoxDecoration(
         color: Colors.blue,
        // color: Colors.orange,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20)
        ),
          
      ),
    );
}

  Widget get _buildTextL{

    return Container(
      child: Center(child: Text("Time to learn Flutter!!", style: TextStyle(color: Colors.white, fontSize: 20),)),
      width: 250,height:50,
      decoration: BoxDecoration(
        color: Colors.blue,
        // color: Colors.orange,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(20),
          topRight: Radius.circular(20),
          topLeft: Radius.circular(20),

        ),
      ),
    );
  }

  Widget _buildTextBoxes(){
    return Container(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 30),
      alignment: Alignment.center,

      // color: Colors.grey[200],
      color: _dark ? Colors.black:Colors.grey[200],
      child: Row(
        children: [
          IconButton(onPressed: (){}, icon: Icon(Icons.attach_file),color: _dark ? Colors.white:Colors.black,),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.white,
              ),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Message",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
          ),
          IconButton(onPressed: (){}, icon: Icon(Icons.mic),color: _dark ? Colors.white:Colors.black,),
        ],
      ),
    );
  }


}
