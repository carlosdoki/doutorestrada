import 'package:doutorestrada/screen/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'Splash';

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    Future.delayed(Duration(seconds: 4)).then((_) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Color(0xFF366D83),
        child: Center(
          child: Container(
            width: 150,
            height: 150,
            child: Image.asset("assets/doutorestrada.png"),
          ),
        ));
  }
}
