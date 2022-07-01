import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test2/pages/state_module/pages/state_detail_page.dart';

import '../logics/counter_logic.dart';
import '../logics/theme_logic.dart';

class StatePage extends StatefulWidget {
  const StatePage({Key? key}) : super(key: key);

  @override
  State<StatePage> createState() => _StatePageState();
}

class _StatePageState extends State<StatePage> {
  bool _dark = false;

  @override
  Widget build(BuildContext context) {
    _dark = context.watch<ThemeLogic>().dark;

    return Scaffold(
      backgroundColor: _dark ? Colors.grey[800] : Colors.white,
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: _dark ? Colors.black : Colors.deepOrangeAccent,
      title: Text("State Page"),
      actions: [
        IconButton(
          onPressed: () {
            context.read<ThemeLogic>().toggleTheme();
          },
          icon: Icon(_dark ? Icons.light_mode : Icons.dark_mode),
        ),
        IconButton(
          onPressed: () {
            context.read<CounterLogic>().decrease();
          },
          icon: Icon(Icons.remove),
        ),
        IconButton(
          onPressed: () {
            context.read<CounterLogic>().increase();
          },
          icon: Icon(Icons.add),
        ),
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => StateDetailPage(),
              ),
            );
          },
          icon: Icon(Icons.settings),
        ),
      ],
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
      "Cambodia is a Southeast Asian nation whose landscape spans low-lying plains, the Mekong Delta, mountains and Gulf of Thailand coastline. Phnom Penh, its capital, is home to the art deco Central Market, glittering Royal Palace and the National Museum's historical and archaeological exhibits. In the country's northwest are the ruins of Angkor Wat, a massive stone temple complex built during the Khmer Empire.",
      style: TextStyle(
        fontSize: 18 + counter.toDouble(),
        color: _dark ? Colors.white60 : Colors.black,
      ),

    );
  }
}
