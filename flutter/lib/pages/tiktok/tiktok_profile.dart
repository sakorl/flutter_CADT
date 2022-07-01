
import 'package:flutter/material.dart';
import '../../constants/movie_list_constants.dart';
import '../../models/movie_models.dart';
class TiktokProfile extends StatefulWidget {
  // const TiktokProfile({Key? key}) : super(key: key);

  @override
  State<TiktokProfile> createState() => _TiktokProfileState();
}

class _TiktokProfileState extends State<TiktokProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody()
    );
  }
}

AppBar _buildAppBar() {
  return AppBar(
     backgroundColor: Colors.white,
    title: Center(child: Text("Tik Tok Profile",style: TextStyle(color: Colors.black),)),
  );
}

class PhotoItem {
  String image;
  PhotoItem(this.image);
}

 List<PhotoItem> _items = [
  PhotoItem("https://static.wikia.nocookie.net/marvelmovies/images/4/46/TW_poster.jpg/revision/latest?cb=20140119030905"),
  PhotoItem("https://nextbigwhat.com/wp-content/uploads/2021/12/spider_man_no_way_home_india_1638191040.webp"),
  PhotoItem("https://media1.popsugar-assets.com/files/thumbor/_Rrjw5u5qeqlO8Zznc0TskZB_8k/fit-in/1024x1024/filters:format_auto-!!-:strip_icc-!!-/2018/04/30/868/n/1922283/1f2e59ed5ae773b06f2879.82877284_/i/Does-Iron-Man-Die-Avengers-Infinity-War.jpg"),
  PhotoItem("https://i.pinimg.com/originals/4b/a1/0a/4ba10a5ee744ac3d9767775cd890ca1c.jpg"),
  PhotoItem("https://cdn.vox-cdn.com/thumbor/bSTm-UcWgZchGXVz0AosS4RYy8g=/1400x1400/filters:format(jpeg)/cdn.vox-cdn.com/uploads/chorus_asset/file/23434598/DrStrange2_Payoff_1_Sht_v6_Lg.jpeg"),
  PhotoItem("https://m.media-amazon.com/images/I/61X-D3MUNFL._AC_SY679_.jpg"),
  PhotoItem( "https://www.mcgilltribune.com/wp-content/uploads/2022/03/ign.com-1.jpeg"),
  PhotoItem("https://nextbigwhat.com/wp-content/uploads/2021/12/spider_man_no_way_home_india_1638191040.webp"),
  PhotoItem("https://pbs.twimg.com/media/FJCoCv4UYAQ8xmM.jpg"),
];

Widget _buildBody() {
  return Container(
    child: _buildTikTokProfile,
  );
}

Widget get _buildTikTokProfile{
  return GridView.builder(
    padding: EdgeInsets.all(10),
    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
       crossAxisSpacing: 5,
       mainAxisSpacing: 5,
      crossAxisCount: 3,
    ),
    itemCount: _items.length,
    itemBuilder: (context, index) {
      return Container(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(_items[index].image),
            ),
          ),
        ),
      );
      // Item rendering
    },
  );
}




