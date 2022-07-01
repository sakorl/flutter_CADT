import 'package:flutter/material.dart';
import 'package:test2/constants/movie_list_constants.dart';

import '../models/movie_models.dart';

class SlideShow extends StatefulWidget {
  const SlideShow({Key? key}) : super(key: key);

  @override
  State<SlideShow> createState() => _SlideShowState();
}

class _SlideShowState extends State<SlideShow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar,
      body: _buildBody,
    );
  }

  AppBar get _buildAppBar{
    return AppBar(
      title: Center(child: Text("Slide Show")),
    );
  }

  Widget get _buildBody{
    return Container(
      child: _buildSlideShow(),
    );
  }

  Widget get _buildPageView{
    return Container(
      child: PageView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          Container( height: 50 ,color: Colors.blue,),
          Container( height: 100 ,color: Colors.red,),
          Container( height: 50 ,color: Colors.green,),
          Container( height: 100 ,color: Colors.pink,),
        ],
      ),
    );
  }


  Widget _buildSlideShow() {
    return SizedBox(
      height: 500,
      child: PageView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: movieList.length,
        itemBuilder: (context, index) {
          return _buildItem(movieList[index]);
        },
      ),
    );
  }

  Widget _buildItem(MovieModel item) {
    return Container(
      child: Image.network(
        item.image,
        fit: BoxFit.cover,
      ),
    );
  }
}
