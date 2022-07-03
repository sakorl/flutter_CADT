import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'helper.dart';
import 'model.dart';

class JsonPhotoPage extends StatefulWidget {
  // const JsonplaceholderPage({Key? key}) : super(key: key);

  @override
  State<JsonPhotoPage> createState() => _JsonplaceholderPageState();
}

class _JsonplaceholderPageState extends State<JsonPhotoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.blue,
      title: Center(child: Text("Json Photo Page")),
    );
  }

  Widget _buildBody() {
    return Container(
      alignment: Alignment.center,
      child: _buildFlutterBuilder(),
    );
  }

  Widget _buildFlutterBuilder() {
    return FutureBuilder<List<Model>>(
      future: Helper.read(),
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

  Widget _buildDisplay(List<Model>? items) {
    if (items == null) {
      return Icon(Icons.error);
    }

    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return _buildItem(items[index]);
      },
    );
  }

  Widget _buildItem(Model item) {
    return Card(
      child: ListTile(
        leading: Text("${item.id}"),

        title: Text(
          "${item.title}",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey[600],
          ),
        ),
        subtitle: Column(
          children: [
            Image.network("${item.url}"),
            SizedBox(
              height: 10,
            ),
            Image.network("${item.thumbnailUrl}"),
          ],
        ),
        trailing: Text("${item.albumId}"),
        // : Image.network("${item.thumbnailUrl}")
      ),
    );
  }
}

//   Widget _buildItem(Results item) {
//     return Card(
//       child: ListTile(
//         leading: Image.network(item.picture.large),
//         title: Text("${item.name.title} ${item.name.first} ${item.name.last}"),
//         subtitle: Text("${item.location.city}, ${item.location.country}"),
//         trailing: Text("${item.nat}"),
//       ),
//     );
//   }
// }
