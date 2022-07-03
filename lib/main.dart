import 'package:flutter/material.dart';
import 'package:test2/helper/my_login.dart';
import 'package:test2/pages/api/api_page.dart';
import 'package:test2/pages/api/jsonplaceholder_page.dart';
import 'package:test2/pages/api_homework/jsonphoto.dart';
import 'package:test2/pages/api_random_user/random_user_page.dart';
import 'package:test2/pages/async/async_page.dart';
import 'package:test2/pages/bottm_navigation.dart';
import 'package:test2/pages/main_page.dart';
import 'package:test2/pages/md5_home.dart';
import 'package:test2/pages/none_state_module/none_state_page.dart';
import 'package:test2/pages/practice.dart';
import 'package:test2/pages/row_column.dart';
import 'package:test2/pages/slide_show.dart';
import 'package:test2/pages/state_module/pages/state_page.dart';
import 'package:test2/pages/teacher.dart';
import 'package:test2/pages/telegram_page.dart';
import 'package:test2/pages/tiktok/tiktok_slide_show.dart';
import 'package:test2/pages/api_good_random_user/random_user_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: JsonPhotoPage(),
    );
  }
}
