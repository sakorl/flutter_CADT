
import 'package:page_transition/page_transition.dart';

import '../constants/movie_list_constants.dart';
import '../models/movie_models.dart';
import 'package:flutter/material.dart';
import '../constants/tiktok_list.dart';

import 'detail_page.dart';


class MyRowColumnPage extends StatefulWidget {
  const MyRowColumnPage({Key? key}) : super(key: key);

  @override
  State<MyRowColumnPage> createState() => _MyRowColumnPageState();
}

class _MyRowColumnPageState extends State<MyRowColumnPage> with AutomaticKeepAliveClientMixin {
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

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.grey[900],
      title: _buildTikTokTitle,
    );
  }

  Widget get _buildTikTokTitle{
    return Container(
      child: Text("Tik Tok Profile"),
    );
  }

  Widget _buildAppBarMenu3() {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          InkWell(
            child: Text("Movies"),
            onTap: () {},
          ),
          SizedBox(width: 10),
          InkWell(
            child: Text("Latest"),
            onTap: () {},
          ),
          SizedBox(width: 10),
          InkWell(
            child: Text("Trends"),
            onTap: () {},
          ),
          SizedBox(width: 10),
          InkWell(
            child: Text("Funny"),
            onTap: () {},
          ),
          SizedBox(width: 10),
          InkWell(
            child: Text("Entertainment"),
            onTap: () {},
          ),
          SizedBox(width: 10),
          InkWell(
            child: Text("Politics"),
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildAppBarMenu2() {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween, //ignored because of Spacer()
      children: [
        InkWell(
          child: Text("Movies"),
          onTap: () {},
        ),
        SizedBox(width: 10),
        InkWell(
          child: Text("Latest"),
          onTap: () {},
        ),
        SizedBox(width: 10),
        InkWell(
          child: Text("Trends"),
          onTap: () {},
        ),
        Spacer(),
        IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
        IconButton(onPressed: () {}, icon: Icon(Icons.ios_share)),
      ],
    );
  }

  Widget _buildAppBarMenu1() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          child: Text("Movies"),
          onTap: () {},
        ),
        InkWell(
          child: Text("Latest"),
          onTap: () {},
        ),
        InkWell(
          child: Text("Trends"),
          onTap: () {},
        ),
        IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
      ],
    );
  }

  Widget _buildBody() {
    return Container(
      // alignment: Alignment.center,
      color: Colors.black,
      child: _buildListViewBuilder(),
    );
  }

  Widget _buildListViewBuilder() {
    return ListView.builder(
      itemCount: movieList.length,
      itemBuilder: (context, index) {
        return _buildItem(movieList[index]);
      },
    );
  }

  Widget _buildItem(MovieModel item) {
    return InkWell(
      onTap: () {
        // Navigator.of(context).push(
        //   MaterialPageRoute(
        //     builder: (context) => DetailPage(item),
        //   ),
        // );

        Navigator.of(context).push(
          PageTransition(
            child: DetailPage(item),
            type: PageTransitionType.bottomToTop,
            fullscreenDialog: true,
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(10),
        // alignment: Alignment.center,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    image: DecorationImage(
                      image: NetworkImage(item.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Icon(Icons.play_circle_fill, size: 100, color: Colors.white),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
                color: Colors.white,
              ),
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(item.title, style: TextStyle(fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListView() {
    return Container(
      color: Colors.yellow.withOpacity(0.5), //for debug
      child: ListView(
        children: [
          Container(height: 200, color: Colors.pink),
          Container(height: 150, color: Colors.orange),
          Container(height: 120, color: Colors.blue),
          Container(height: 170, color: Colors.purple),
          Container(height: 150, color: Colors.greenAccent),
          Container(height: 150, color: Colors.indigo),
        ],
      ),
    );
  }

  Widget _buildColumn() {
    return Container(
      color: Colors.yellow.withOpacity(0.5), //for debug
      child: SingleChildScrollView(
        // physics: NeverScrollableScrollPhysics(),
        physics: BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(width: 150, height: 150, color: Colors.pink),
            Container(width: 120, height: 150, color: Colors.orange),
            Container(width: 70, height: 120, color: Colors.blue),
            Container(width: 150, height: 170, color: Colors.purple),
            Container(width: 140, height: 150, color: Colors.greenAccent),
            Container(width: 50, height: 150, color: Colors.indigo),
          ],
        ),
      ),
    );
  }

  Widget _buildRow() {
    return Container(
      color: Colors.yellow.withOpacity(0.5), //for debug
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(width: 50, height: 50, color: Colors.pink),
          Container(width: 50, height: 150, color: Colors.orange),
          Container(width: 70, height: 120, color: Colors.blue),
          Container(width: 50, height: 70, color: Colors.purple),
          Container(width: 40, height: 250, color: Colors.greenAccent),
          Container(width: 50, height: 150, color: Colors.indigo),
        ],
      ),
    );
  }

  Widget get _buildTikTokProfile{
    return GridView.builder(
      padding: EdgeInsets.all(5),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 4/6,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      itemCount: movieList.length,
      itemBuilder: (context, index){
        return _buildItem(movieList[index]);
      },);
  }

  Widget get _buildGrideView{
    return GridView.builder(
      padding: EdgeInsets.all(5),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
      ),
      itemCount: tiktokList.length,
      itemBuilder: (context, index){
        return _buildItem(movieList[index]);
      },);
  }
}
