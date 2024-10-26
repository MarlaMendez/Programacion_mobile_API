import 'package:flutter/material.dart';
import 'package:flutter_appi/api_service.dart';
import 'package:flutter_appi/post.dart';


class Pagina extends StatefulWidget {
  const Pagina({super.key});

  @override
  State<Pagina> createState() => _PaginaState();
}

class _PaginaState extends State<Pagina> {
  final ApiService apiService = ApiService();
  
  List<Post> posts = [];

    @override
  void initState() {
    _loadPosts();
    super.initState();
  }

  // funcion para cargar los datos
  void _loadPosts() async{
    var aux = await apiService.getPosts();
    setState(() {
      posts =  aux;
    });

  }

 // funcion para crear
  void _createPost() async{
    Post novoPost = Post(userId: 200, id: 1, title: "Novo titulo", body: "Informaçoes do novo post");
    Post? aux = await apiService.createPost(novoPost);
    if(aux!=null){
      print('${aux.userId} - ${aux.id} - ${aux.title} - ${aux.body}');
    }
    _loadPosts();
  }

// funcion para actualizar
  void _updatePost() async{
    Post updatePost = Post(userId: 200, id: 1, title: "Titulo atualizado", body: "Informaçoes atualizada");
    Post? aux = await apiService.updatePost(updatePost,1);
    if(aux!=null){
      print('${aux.userId} - ${aux.id} - ${aux.title} - ${aux.body}');
    }
    _loadPosts();
  }

// funcion para eliminar
  void _deletePost()async{
    await apiService.deletePost(1);
    _loadPosts();
  }


  


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text("Api Exemplo"),
        backgroundColor: Colors.pink,
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 10,
              child: ListTile(
                title: Text('${posts[index].userId} - ${posts[index].id}'),
                subtitle: Text('${posts[index].title} - ${posts[index].body}'),
                
              ),
            ),
          );
        }
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            backgroundColor: Colors.pink,
            onPressed: _createPost,
            child: const Icon(Icons.add),  
            ),
      const SizedBox(height: 10,),
      FloatingActionButton(
        backgroundColor: Colors.pink,
            onPressed: _updatePost,
            child: const Icon(Icons.update),  
            ),
      const SizedBox(height: 10,),
      FloatingActionButton(
        backgroundColor: Colors.pink,
            onPressed: _deletePost,
            child: const Icon(Icons.delete),  
            ),
        ],
      ),
    );
  }
}