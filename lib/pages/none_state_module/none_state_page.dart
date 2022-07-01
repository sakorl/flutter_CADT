
import 'package:flutter/material.dart';

import 'none_state_detail_page.dart';

class NoneStatePage extends StatefulWidget {
  const NoneStatePage({Key? key}) : super(key: key);

  @override
  State<NoneStatePage> createState() => _NoneStatePageState();
}

class _NoneStatePageState extends State<NoneStatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text("None State Page"),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => NoneStateDetailPage(_counter),
              ),
            );
          },
          icon: Icon(Icons.settings),
        ),
      ],
    );
  }

  Widget _buildBody() {
    return Container(
      child: Column(
        children: [
          Expanded(child: _buildButtons()),
          Expanded(child: _buildText()),
          // Expanded(child: _buildTextMe()),
        ],
      ),
    );
  }

  // Widget _buildTextMe(){
  //
  //   return Container(
  //     child: Row(
  //       children: [
  //         Text("Don't worry I know nothing"),
  //         // SizedBox(width: 50,),
  //         Text("Don't worry I know nothing"),
  //       ],
  //     ),
  //   );
  // }

  int _counter = 0;

  Widget _buildButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              _counter--;
            });
          },
          icon: Icon(Icons.remove),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              _counter++;
            });
          },
          icon: Icon(Icons.add),
        ),
      ],
    );
  }

  Widget _buildText() {
    return Text(
      "counter: $_counter",
      style: TextStyle(fontSize: 20),
    );
  }
}
