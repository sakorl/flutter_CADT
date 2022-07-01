import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test2/pages/api_random_user/random_user_model.dart';
import '../api_random_user/random_user_helper.dart';
import 'package:test2/pages/api_random_user/random_user_helper.dart';

class RandomUserPage extends StatefulWidget {
  const RandomUserPage({Key? key}) : super(key: key);

  @override
  State<RandomUserPage> createState() => _RandomUserPageState();
}

class _RandomUserPageState extends State<RandomUserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.orange,
      title: Center(child: Text("Random User Page")),
    );
  }

  Widget _buildBody() {
    return Container(
      alignment: Alignment.center,
      child: _buildFutureBuilder(),
    );
  }

  Widget _buildFutureBuilder() {
    return FutureBuilder<RandomUser>(
      future: RandomUserHelper.read(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return _buildDisplay(snapshot.data);
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  Widget _buildDisplay(RandomUser? randomUser) {
    if (randomUser == null) {
      return Icon(Icons.error);
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Seed: ${randomUser.info.seed}"),
        Text("Result: ${randomUser.info.results}"),
        Text("Page: ${randomUser.info.page}"),
        Text("Version: ${randomUser.info.version}"),
      ],
    );

  }
}

