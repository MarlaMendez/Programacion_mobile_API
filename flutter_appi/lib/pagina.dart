import 'package:flutter/material.dart';
import 'package:flutter_appi/post.dart';

class Pagina extends StatefulWidget {
  const Pagina({super.key});

  @override
  State<Pagina> createState() => _PaginaState();
}

class _PaginaState extends State<Pagina> {
  List<Post> posts = [];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index){
          return ListTile(
            title: Text('${posts[index].userId}'),
          );
        }
      )



    );
  }
}