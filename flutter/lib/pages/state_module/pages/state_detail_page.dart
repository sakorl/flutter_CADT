import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../logics/theme_logic.dart';
import '../logics/counter_logic.dart';

class StateDetailPage extends StatefulWidget {
  // const NoneStateDetailPage({Key? key}) : super(key: key);

  @override
  State<StateDetailPage> createState() => _StateDetailPageState();
}

class _StateDetailPageState extends State<StateDetailPage> {
  bool _dark = false;

  @override
  Widget build(BuildContext context) {
    _dark = context.watch<ThemeLogic>().dark;

    return Scaffold(
      backgroundColor: _dark ? Colors.blueGrey[700] : Colors.white,
      appBar: _buildAppBar(),
      body: _buildBody(),
      endDrawer: _buildDrawer(),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      backgroundColor: _dark ? Colors.blueGrey[200] : Colors.white,
      child: ListView(
        children: [
          DrawerHeader(
            child: Icon(
              Icons.face,
              size: 100,
            ),
          ),
          ListTile(
            leading: Icon(Icons.remove),
            title: Text("Smaller font"),
            onTap: () {
              context.read<CounterLogic>().decrease();
            },
          ),
          ListTile(
            leading: Icon(Icons.add),
            title: Text("Bigger font"),
            onTap: () {
              context.read<CounterLogic>().increase();
            },
          ),
          ListTile(
            leading: Icon(_dark ? Icons.light_mode : Icons.dark_mode),
            title: Text(_dark ? "Change to Light Mode" : "Change to Dark Mode"),
            onTap: () {
              context.read<ThemeLogic>().toggleTheme();
            },
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: Icon(Icons.arrow_back_ios),
      ),
      backgroundColor: _dark ? Colors.grey[900] : Colors.indigoAccent,
      title: Text("State Detail Page"),
    );
  }

  Widget _buildBody() {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(10),
        child: _buildText(),
      ),
    );
  }

  Widget _buildText() {
    int counter = context.watch<CounterLogic>().counter;

    return Text(
      "Angkor, also known as Yasodharapura, was the capital city of the Khmer Empire. The city and empire flourished from approximately the 9th to the 15th centuries. The city houses the Angkor Wat, one of Cambodia's most popular tourist attractions.",
      style: TextStyle(
        fontSize: 18 + counter.toDouble(),
        color: _dark ? Colors.white60 : Colors.black,
      ),
    );
  }
}
