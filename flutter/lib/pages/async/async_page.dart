// import 'package:flutter/material.dart';
//
// class AsyncPage extends StatefulWidget {
//   const AsyncPage({Key? key}) : super(key: key);
//
//   @override
//   State<AsyncPage> createState() => _AsyncPageState();
// }
//
// class _AsyncPageState extends State<AsyncPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _buildAppBar(),
//       body: _buildBody(),
//     );
//   }
//
//   AppBar _buildAppBar() {
//     return AppBar(
//       title: Text("Async Page"),
//     );
//   }
//
//   Future<String> _getData() {
//     return Future.delayed(Duration(seconds: 1), () {
//       return "Some data!!";
//     });
//   }
//
//   Widget _buildBody() {
//     return Container(
//       alignment: Alignment.center,
//       child: _buildFutureBuilder(),
//     );
//   }
//
//   Widget _buildFutureBuilder() {
//     return FutureBuilder<String>(
//       future: _getData(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.done) {
//           return _buildDisplay(snapshot.data!);
//         } else {
//           return CircularProgressIndicator();
//         }
//       },
//     );
//   }
//
//   Widget _buildDisplay(String? data) {
//     return Text(
//       data ?? "No Data",
//       style: TextStyle(fontSize: 30),
//     );
//   }
// }

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AsyncPage extends StatefulWidget {
  const AsyncPage({Key? key}) : super(key: key);

  @override
  State<AsyncPage> createState() => _AsyncPageState();
}

class _AsyncPageState extends State<AsyncPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  void _showSnackBar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        action: SnackBarAction(
          onPressed: (){
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
          label: "DONE",
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Center(child: Text("Async Page")),
      actions: [
        IconButton(
          onPressed: () {
            _showSnackBar("Hello!");
          },
          icon: Icon(Icons.error),
        ),
      ],
    );
  }


  Widget _buildBody() {
    return Container(
      alignment: Alignment.center,
      child: _buildFutureBuilder(),
    );
  }

  Future<String> _getData() {
    return Future.delayed(Duration(seconds: 10), () {
      return "Some data";
    });
  }

  // Future<int> _getNumber(int max){
  //   int total = 0;
  //   for(int index = 0; index < max; index++){
  //     total += index;
  //   }
  //   return Future.value(total);
  // }

  Future<int> _getNumberInCompute(int maxNumber){
    return compute(_getNumber, maxNumber);
  }

  Widget _buildFutureBuilder() {
    return FutureBuilder<int>(
      future: _getNumberInCompute(100),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return _buildDisplay(snapshot.data!);
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }

  Widget _buildDisplay(int? data) {
    return Text(
      "${data ?? 0}",
      style: TextStyle(fontSize: 30),
    );
  }
}

//Outside of class
int _getNumber(int max){
  int total = 0;
  for(int index = 0; index < max; index++){
    total += index;
  }
  return total;
}



