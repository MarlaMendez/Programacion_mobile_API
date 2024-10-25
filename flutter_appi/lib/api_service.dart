// es tipo el DAO de la clase POST

import 'dart:convert';

import 'package:flutter_appi/post.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://jsonplaceholder.typicode.com/posts';

// METODO GET
  Future<List<Post>> getPosts() async{
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200){
      List<dynamic> body = jsonDecode(response.body);
      return body.map((dynamic item){
        return Post.fromMap(item);
      }).toList();
      
    }
    return [];


  }


}