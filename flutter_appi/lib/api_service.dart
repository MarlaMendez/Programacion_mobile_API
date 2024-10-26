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

// METODO PARA CREAR
  Future<Post?> createPost(Post post) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type":"application/json"},
      body: jsonEncode(post.toMap()),
    );
    if (response.statusCode == 201) {
      print("Dado criado com sucesso");
      return Post.fromMap(jsonDecode(response.body));
    }
    return null;
  }

// METODO PARA ACTUALIZAR.
  Future<Post?> updatePost(Post post, int id) async{
    final response = await http.put(
      Uri.parse('$baseUrl/$id'),
      headers: {"Content-Type":"application/json"},
      body: jsonEncode(post.toMap())
    );
    if(response.statusCode == 200){
      print("Dado atualizado com sucesso");
      return Post.fromMap(jsonDecode(response.body));
    }
    return null;
  }

// METODO PARA ELIMINAR
  Future<void> deletePost(int id) async{
    final response = await http.delete(Uri.parse('$baseUrl/$id'));

    if(response.statusCode == 200){
      print("Dato eliminado con exito");
    }
  }


}