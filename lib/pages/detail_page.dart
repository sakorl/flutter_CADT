import 'package:flutter/material.dart';
import 'package:test2/models/movie_models.dart';

class DetailPage extends StatefulWidget {
  //const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
  MovieModel item;
  DetailPage(this.item);
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar,
      body: _buildBody,
    );
  }

  AppBar get _buildAppBar {
    return AppBar(
      
    );
  }

  Widget get _buildBody {
    return Container(
      child: ListView(
        children: [
          Image.network(widget.item.image),
          Container(
            padding: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(
                  widget.item.title,
                  style: TextStyle(fontSize: 18),
                ),
                // SizedBox(height: 20,),
                // Text("Description",style: TextStyle(fontSize: 25)),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
