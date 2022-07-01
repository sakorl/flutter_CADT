import 'package:flutter/material.dart';

class NoneStateDetailPage extends StatefulWidget {
  // const NoneStateDetailPage({Key? key}) : super(key: key);

  int counter;

  NoneStateDetailPage(this.counter);

  @override
  State<NoneStateDetailPage> createState() => _NoneStateDetailPageState();
}

class _NoneStateDetailPageState extends State<NoneStateDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.purple,
      title: Text("None State Detail Page"),
    );
  }

  Widget _buildBody() {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildButtons(),
          _buildText(),
        ],
      ),
    );
  }

  Widget _buildButtons() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              widget.counter--;
            });
          },
          icon: Icon(Icons.remove),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              widget.counter++;
            });
          },
          icon: Icon(Icons.add),
        ),
      ],
    );
  }

  Widget _buildText() {
    return Text(
      "counter: ${widget.counter}",
      style: TextStyle(fontSize: 20),
    );
  }
}
