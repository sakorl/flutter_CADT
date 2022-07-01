import 'package:flutter/material.dart';
import 'package:test2/pages/slide_show.dart';
import 'package:test2/pages/teacher.dart';
import 'package:test2/pages/telegram_page.dart';
import 'package:test2/pages/tiktok/tiktok_profile.dart';
import 'package:test2/pages/tiktok/tiktok_slide_show.dart';

class MyBottomNavigation extends StatefulWidget {
  const MyBottomNavigation({Key? key}) : super(key: key);

  @override
  State<MyBottomNavigation> createState() => _MyBottomNavigationState();
}

class _MyBottomNavigationState extends State<MyBottomNavigation> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: _buildBody(),
      bottomNavigationBar: _buildBottom(),
    );
  }

  PageController _pageController = PageController();

  Widget _buildBody() {
    return PageView(
      controller: _pageController,
      // physics: BouncingScrollPhysics(),
      physics: NeverScrollableScrollPhysics(),
      onPageChanged: (index){
        setState(() {
          _currentIndex = index;
        });
      },
      children: [
        TiktokProfile(),
        TiktokSlideShow(),
        MyRowColumnPage(),
        SlideShow(),
        TelegramPage(),
      ],
    );
  }

  int _currentIndex = 0;

  Widget _buildBottom() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index){
        setState(() {
          _currentIndex = index;
        });
        _pageController.jumpToPage(_currentIndex);
      },
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.pink,
      unselectedItemColor: Colors.purple[200],
      // showUnselectedLabels: false,
      // showSelectedLabels: false,
      backgroundColor: Colors.black,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.play_arrow), label: "Play"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        BottomNavigationBarItem(icon: Icon(Icons.menu), label: "Menu"),
      ],
    );
  }


}