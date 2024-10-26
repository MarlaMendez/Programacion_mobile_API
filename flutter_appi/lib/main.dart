
import 'package:flutter/material.dart';
import 'package:flutter_appi/pagina.dart';

void main() {
  runApp(const MyApp());
}

// pagina principal
class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: Pagina(),
    );
  }
}
