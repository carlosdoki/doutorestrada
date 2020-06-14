import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:doutorestrada/screen/fidelidadescreen.dart';
import 'package:doutorestrada/screen/mapascreen.dart';
import 'package:doutorestrada/widget/noticias_carrousel.dart';
import 'package:doutorestrada/widget/postos_carrousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'home';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFF366D83),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          iconSize: 28.0,
          onPressed: () {},
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications_none),
            iconSize: 28.0,
            onPressed: () {},
          ),
        ],
      ),
      body: CustomScrollView(
        physics: ClampingScrollPhysics(),
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Color(0xFF366D83),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0),
                ),
              ),
              child: Column(
                children: <Widget>[
                  StreamBuilder<QuerySnapshot>(
                    stream:
                        Firestore.instance.collection('usuario').snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return new Text("Loading");
                      }
                      var userDocument = snapshot.data.documents;
                      return Text(
                        userDocument[0]['nome'],
                        style: const TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w600,
                        ),
                      );
                    },
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                       Text(
                        'Trajeto:',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                        SizedBox(
                          width: 10,
                  ),
                        Container(
                          width: 20.0,
                            child: TextField(
                              decoration:  InputDecoration.collapsed(
                                  hintText: 'Origem',
                              ),
                              style: TextStyle(
                                fontSize: 20.0,
                              ),
                            ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '-',
                          style: TextStyle(
                          fontSize: 20.0,
                        ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          width: 20.0,
                          child: TextField(
                            decoration:  InputDecoration.collapsed(
                                hintText: 'Destino',
                            ),
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                ],
              ),
            ),
                ],
          ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: NoticiasCarrousel(),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: PostosCarrousel(),
            ),
          ),
        ],
      ),
      // body: Column(
      //   children: <Widget>[
      //     ClipPath(
      //       clipper: MyClipper(),
      //       child: Container(
      //         padding: EdgeInsets.only(left: 40, top: 50, right: 20),
      //         height: 250,
      //         width: double.infinity,
      //         decoration: BoxDecoration(
      //           gradient: LinearGradient(
      //             begin: Alignment.topRight,
      //             end: Alignment.bottomLeft,
      //             colors: [
      //               Color(0xFF366D83),
      //               Color(0xFF5CE1E6),
      //               Color(0xFF261C19),
      //             ],
      //           ),
      //         ),
      //         child: Row(
      //           mainAxisAlignment: MainAxisAlignment.end,
      //           // crossAxisAlignment: CrossAxisAlignment.end,
      //           children: <Widget>[
      //             Center(
      //               child: StreamBuilder<QuerySnapshot>(
      //                 stream:
      //                     Firestore.instance.collection('usuario').snapshots(),
      //                 builder: (context, snapshot) {
      //                   if (!snapshot.hasData) {
      //                     return new Text("Loading");
      //                   }
      //                   var userDocument = snapshot.data.documents;
      //                   print(userDocument.length);
      //                   return Text(userDocument[0]['nome']);
      //                 },
      //               ),
      //             ),
      //             IconButton(
      //               icon: const Icon(Icons.notifications_none),
      //               iconSize: 28.0,
      //               onPressed: () {},
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 0,
        height: 60.0,
        items: <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.account_balance_wallet, size: 30),
          Icon(Icons.info, size: 30),
          Icon(Icons.perm_identity, size: 30),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Color(0xFF366D83),
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          switch (index) {
            case 1:
              Navigator.pushNamed(
                context,
                FidelidadeScreen.id,
              );
              break;
            // case 2:
            //   Navigator.pushNamed(
            //     context,
            //     MapaScreen.id,
            //   );
            //   break;
          }
          setState(() {
            _page = index;
          });
        },
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    throw UnimplementedError();
  }
}
