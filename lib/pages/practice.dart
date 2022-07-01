import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants/fruit.dart';

class Practice extends StatefulWidget {
  @override
  State<Practice> createState() => _PracticeState();
}

class _PracticeState extends State<Practice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _dark ? Colors.blue : Colors.white,
      appBar: _buildAppBar,
      endDrawer: _buildDrawer,
      body: _buildBody,
      bottomNavigationBar: _buildBottomNavigation,
      floatingActionButton: _buildFloating,
    );
  }

  Widget get _buildGrid {
    return GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      children: <Widget>[
        Container(color: Colors.pink),
        Container(color: Colors.indigo),
        Container(color: Colors.blue),
        Container(color: Colors.pink),
        Container(color: Colors.pink),
        Container(color: Colors.indigo),
      ],
    );
  }

  bool _dark = false;
  bool _english = true;

  AppBar get _buildAppBar {
    return AppBar(
      backgroundColor: _dark ? Colors.blue : Colors.red,
      // title: Center(child: Text("សូមស្វាគមន៍",style: TextStyle(fontSize: 30,fontFamily: "KhmerOSsiemreap",), )),
      title: _buildSearchTextfield,
      leading: IconButton(
          onPressed: () {
            setState(() {
              _dark = !_dark;
            });
            print("_dark : $_dark");
          },
          icon: Icon(Icons.home)),
      // actions: [
      //   IconButton(onPressed: (){}, icon: Icon(Icons.share)),
      //   IconButton(onPressed: (){
      //     setState((){
      //       _english = !_english;
      //     });
      //   }, icon: Icon(Icons.crop_square)),
      // ],
    );
  }

  Widget get _buildStansform {
    return Container(
      alignment: Alignment.center,
      child: Container(
        width: 200.0,
        height: 200.0,
        transform: Matrix4.rotationZ(0.2),
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0)),
        ),
      ),
    );
  }

  Widget get _buildFloating {
    return FloatingActionButton(
        child: Icon(FontAwesomeIcons.mapLocation), onPressed: () {});
  }

  Widget get _buildBottom {
    return Container(
      color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
              onPressed: () {}, icon: Icon(FontAwesomeIcons.houseMedical)),
          IconButton(
              onPressed: () {}, icon: Icon(FontAwesomeIcons.peopleGroup)),
          IconButton(onPressed: () {}, icon: Icon(FontAwesomeIcons.play)),
          IconButton(onPressed: () {}, icon: Icon(FontAwesomeIcons.share)),
          IconButton(
              onPressed: () {}, icon: Icon(FontAwesomeIcons.mobileRetro)),
        ],
      ),
    );
  }

  Widget get _buildBody {
    return Container(
      alignment: Alignment.center,
      // child: Center(child: Image.network(s1)),
      child: _buildGrid,
    );
  }

  Widget get _buildListView {
    return Container(
      color: Colors.grey[200],
      child: ListView.builder(
          itemCount: fruits.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(bottom: 10.0),
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Container(
                    width: 100.0,
                    height: 100.0,
                    child: Image.asset(
                      fruits[index].imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      fruits[index].title,
                      style: TextStyle(fontSize: 22.0),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }

  Widget get _buildCircle {
    return Container(
      width: 200.0,
      height: 200.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.pink,
            Colors.red,
            Colors.orange,
          ],
        ),
        color: Colors.deepPurple,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
              color: Colors.red.withOpacity(0.5),
              offset: Offset(15.0, 15.0),
              blurRadius: 10.0),
        ],
      ),
    );
  }

  Widget get _buildDrawer {
    return Drawer(
      backgroundColor: Colors.redAccent,
      child: Image.asset("assets/images/img.png"),
    );
  }

  Widget get _buildTextfield {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.pink,
        borderRadius: BorderRadius.circular(50),
      ),
      child: TextField(
        // obscureText: true,
        style: TextStyle(color: Colors.white),
        keyboardType: TextInputType.emailAddress,

        decoration: InputDecoration(
          hintText: _english ? "email" : "អុីម៉ែល",
          hintStyle: TextStyle(color: Colors.white60),
          icon: Icon(
            Icons.email,
            color: Colors.white,
          ),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.send,
              color: Colors.white,
            ),
          ),
          border: InputBorder.none,
        ),
        obscureText: false,
      ),
    );
  }

  Widget get _buildSearchTextfield {
    return Container(
      margin: EdgeInsets.all(10),
      child: TextField(
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: _english ? "Search..." : "ស្វែងរក...",
          hintStyle: TextStyle(color: Colors.white60),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
          //           Build Stack

  Widget _buildStack() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(width: 350, height: 350, color: Colors.pink),
        Container(width: 220, height: 250, color: Colors.orange),
        Container(width: 170, height: 100, color: Colors.blue),
        Positioned(
          right: 150,
          bottom: 100,
          child: //Icon(Icons.movie,color: Colors.yellow,)
              Container(width: 50, height: 50, color: Colors.yellow),
        ),
      ],
    );
  }

  //   BottomNavigationBar

  int _currentIndex=0;
Widget get _buildBottomNavigation{
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index){
        setState((){
          _currentIndex = index;
        });
      },
      type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.red,
      unselectedItemColor: Colors.blue,
      // showSelectedLabels: false,
      // showUnselectedLabels: false,

      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.play_arrow),label: "Play"),
        BottomNavigationBarItem(icon: Icon(Icons.person),label: "Person"),
        BottomNavigationBarItem(icon: Icon(Icons.menu),label: "Menu"),
      ],

        );
}

}
