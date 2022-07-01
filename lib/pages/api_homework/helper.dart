import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../api_homework/model.dart';

class Helper{
  static Future<List<Model>> read() async{
    String url = "https://jsonplaceholder.typicode.com/photos?albumId=2";
    try{
      http.Response respone = await http.get(Uri.parse(url));
      if(respone.statusCode == 200){
        return compute(getPostMOdelList, respone.body);
      }else{
        throw Exception("Error While reading code : ${respone.statusCode}");
      }
    }catch (e){
      throw Exception("Error while reading, ${e.toString()}");
    }
  }
}