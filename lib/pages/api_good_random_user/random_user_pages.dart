import '../api_good_random_user/random_user_models.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../api_good_random_user/random_user_helpers.dart';


class RRandomUserPages extends StatefulWidget {
  const RRandomUserPages({Key? key}) : super(key: key);

  @override
  State<RRandomUserPages> createState() => _RRandomUserPagesState();
}

class _RRandomUserPagesState extends State<RRandomUserPages> {
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
      title: Text("Random User Page"),
    );
  }

  Widget _buildBody() {
    return Container(
      alignment: Alignment.center,
      child: _buildFutureBuilder(),
    );
  }

  Widget _buildFutureBuilder() {
    return FutureBuilder<RandomUserModel>(
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

  Widget _buildDisplay(RandomUserModel? randomUser) {
    if (randomUser == null) {
      return Icon(Icons.error);
    }

    return ListView.builder(
      itemCount: randomUser.results.length,
      itemBuilder: (context, index) {
        return _buildItem(randomUser.results[index]);
      },
    );

  }

  Widget _buildItem(Results item) {
    return Card(
      child: ListTile(
        leading: Image.network(item.picture.large),
        title: Text("${item.name.title} ${item.name.first} ${item.name.last}"),
        subtitle: Text("${item.location.city}, ${item.location.country}"),
        trailing: Text("${item.nat}"),
      ),
    );
  }
}

