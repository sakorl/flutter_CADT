

import 'dart:convert';
import 'package:crypto/crypto.dart';

class MyLogin {
  late String _password;

  set password(String text){
    _password = text;
  }
  String get hash{
    var bytes = utf8.encode(_password);
    var digest = sha1.convert(bytes);
    return digest.toString();
}
}