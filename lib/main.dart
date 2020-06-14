import 'package:doutorestrada/screen/fidelidadescreen.dart';
import 'package:doutorestrada/screen/homescreen.dart';
import 'package:doutorestrada/screen/loginscreen.dart';
import 'package:doutorestrada/screen/mapascreen.dart';
import 'package:doutorestrada/screen/noticiasscreen.dart';
import 'package:doutorestrada/screen/postosscreen.dart';
import 'package:doutorestrada/screen/resgatescreen.dart';
import 'package:doutorestrada/screen/splashscreen.dart';
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
      initialRoute: SplashScreen.id,
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        FidelidadeScreen.id: (context) => FidelidadeScreen(),
        NoticiasScreen.id: (context) => NoticiasScreen(),
        PostosScreen.id: (context) => PostosScreen(),
        MapaScreen.id: (context) => MapaScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        SplashScreen.id: (context) => SplashScreen(),
        ResgateScreen.id: (context) => ResgateScreen(),
        // MapScreen.id: (context) => MapScreen(),
      },
    );
  }
}
