import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test2/pages/tiktok/item_list.dart';
import 'package:test2/pages/tiktok/item_model.dart';
class TiktokSlideShow extends StatefulWidget {
  const TiktokSlideShow({Key? key}) : super(key: key);

  @override
  State<TiktokSlideShow> createState() => _TiktokSlideShowState();
}

class _TiktokSlideShowState extends State<TiktokSlideShow> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: _buildBody,
      bottomNavigationBar: _buildBottom,
    );
  }

  Widget get _buildBody{
    return PageView.builder(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemCount: itemList.length,
      itemBuilder: (context, index){
        return _buildItem(itemList[index]);
      },
    );
  }

  Widget _buildItem(ItemModel item){
    return Stack(
      alignment: Alignment.center,
      children: [
        Positioned.fill(
          child: Image.network(item.image, fit: BoxFit.cover,),
        ),
        Positioned(
            right: 10,
            bottom: 30,
            child: _buildIconRightBox,
        ),
        Positioned(
          top: 50,
          child: _buildTextTop,
        ),
        Positioned(
          left:15,
          bottom: 10,
          child: _buildTextBottom,
        ),
      ],
    );

  }

  Widget get _buildTextBottom{
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("@sakorl8888",style: TextStyle(color: Colors.white,fontSize: 20),),
        SizedBox(height: 20,),
        Text("This is the title of your posting",style: TextStyle(color: Colors.white,fontSize: 15),),
        SizedBox(height: 20,),
        Row(
          children: [
            IconButton(onPressed: (){}, icon: Icon(Icons.music_note,color: Colors.white,)),
            Text("Love me like you do.........",style: TextStyle(color: Colors.white,fontSize: 15),)
          ],
          
        ),
      ],
    );
  }
  
  Widget get _buildTextTop{
    return Container(
      child: Text("Following  |  For you",style: TextStyle(color: Colors.white,fontSize: 20),)
    );
  }

  bool _favorite = false;
  Widget get _buildIconRightBox{
    return Column(
      children: [
        IconButton(onPressed: (){}, icon: Icon(Icons.person,color: Colors.white,)),
        SizedBox(height: 20,),

        InkWell(onTap: (){
          setState((){
            _favorite = ! _favorite;
          });
        }, child: Column(
          children: [
            Icon(Icons.favorite,color: _favorite ? Colors.red : Colors.white,),
            Text("100.5K",style: TextStyle(color: Colors.white),)
          ],
        )),
        SizedBox(height: 20,),

        InkWell(onTap: (){}, child: Column(
          children: [
            Icon(Icons.message,color: Colors.white,),
            Text("10.5K",style: TextStyle(color: Colors.white),)
          ],
        )),
        SizedBox(height: 20,),

        InkWell(onTap: (){}, child: Column(
          children: [
            Icon(Icons.bookmark,color: Colors.white,),
            Text("1.5K",style: TextStyle(color: Colors.white),)
          ],
        )),
        SizedBox(height: 20,),

        InkWell(onTap: (){}, child: Column(
          children: [
            Icon(CupertinoIcons.arrowshape_turn_up_right_fill,color: Colors.white,),
            Text("8.5K",style: TextStyle(color: Colors.white),)
          ],
        )),
        SizedBox(height: 20,),

      ],
    );
  }

  Widget get _buildBottom{
    return BottomAppBar(
      color: Colors.black,
      child: Row(

        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(onPressed: (){}, icon: Icon(Icons.home,color: Colors.white,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.search,color: Colors.white,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.add,color: Colors.white,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.message,color: Colors.white,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.person,color: Colors.white,)),
        ],
      ),
    );
  }
}

