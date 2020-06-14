import 'package:doutorestrada/screen/fidelidadescreen.dart';
import 'package:doutorestrada/screen/homescreen.dart';
import 'package:doutorestrada/screen/mapascreen.dart';
import 'package:doutorestrada/screen/noticiasscreen.dart';
import 'package:doutorestrada/screen/postosscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  //AIzaSyATujIHH5lRYvpIfmW2VLGAVguhNGaN9Es
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.id,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        FidelidadeScreen.id: (context) => FidelidadeScreen(),
        NoticiasScreen.id: (context) => NoticiasScreen(),
        PostosScreen.id: (context) => PostosScreen(),
        MapaScreen.id: (context) => MapaScreen(),
        // MapScreen.id: (context) => MapScreen(),
      },
    );
  }
}
