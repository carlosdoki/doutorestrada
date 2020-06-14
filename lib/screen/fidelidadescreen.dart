import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:doutorestrada/models/transaction_model.dart';
import 'package:doutorestrada/screen/homescreen.dart';
import 'package:doutorestrada/screen/resgatescreen.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class FidelidadeScreen extends StatefulWidget {
  static const String id = 'fidelidade';

  @override
  _FidelidadeScreenState createState() => _FidelidadeScreenState();
}

class _FidelidadeScreenState extends State<FidelidadeScreen> {
  int _page = 1;
  GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFF366D83),
        leading: IconButton(
          icon: const Icon(
            Icons.menu,
          ),
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
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.only(left: 16, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Fidelidade',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.black),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, ResgateScreen.id);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      height: 200,
                      width: 300,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Posto 1',
                            style: TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w300),
                          ),
                          Row(
                            children: <Widget>[
                              Checkbox(
                                value: true,
                                onChanged: null,
                              ),
                              Checkbox(
                                value: true,
                                onChanged: null,
                              ),
                              Checkbox(
                                value: true,
                                onChanged: null,
                              ),
                              Checkbox(
                                value: true,
                                onChanged: null,
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Checkbox(
                                value: true,
                                onChanged: null,
                              ),
                              Checkbox(
                                value: true,
                                onChanged: null,
                              ),
                              Checkbox(
                                value: true,
                                onChanged: null,
                              ),
                              Checkbox(
                                value: true,
                                onChanged: null,
                              ),
                              Checkbox(
                                value: true,
                                onChanged: null,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: // Transaction Section
                Padding(
              padding:
                  EdgeInsets.only(left: 16, bottom: 13, top: 29, right: 10),
              child: Text(
                'Historico de Transações',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: ListView.builder(
              itemCount: transactions.length,
              padding: EdgeInsets.only(left: 16, right: 16),
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  height: 76,
                  margin: EdgeInsets.only(bottom: 13),
                  padding:
                      EdgeInsets.only(left: 24, top: 12, bottom: 12, right: 22),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 10,
                        spreadRadius: 5,
                        offset: Offset(8.0, 8.0),
                      )
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            height: 57,
                            width: 57,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              // image: DecorationImage(
                              //   image: AssetImage(transactions[index].photo),
                              // ),
                            ),
                          ),
                          SizedBox(
                            width: 13,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                transactions[index].name,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black),
                              ),
                              Text(
                                transactions[index].date,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey),
                              )
                            ],
                          )
                        ],
                      ),
                      // Row(
                      //   children: <Widget>[
                      //     Text(
                      //       transactions[index].amount,
                      //       style: TextStyle(
                      //           fontSize: 15,
                      //           fontWeight: FontWeight.w700,
                      //           color: Colors.blue),
                      //     )
                      //   ],
                      // )
                    ],
                  ),
                );
              },
            ),
          ),

          // SliverToBoxAdapter(
          //   child: Container(
          //     padding: const EdgeInsets.all(20.0),
          //     child: NoticiasCarrousel(),
          //   ),
          // ),
          // SliverToBoxAdapter(
          //   child: Container(
          //     padding: const EdgeInsets.all(20.0),
          //     child: PostosCarrousel(),
          //   ),
          // ),
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
        index: 1,
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
          setState(() {
            _page = index;
          });

          switch (index) {
            case 0:
              Navigator.pushNamed(context, HomeScreen.id);
              break;
            case 1:
              Navigator.pushNamed(
                context,
                FidelidadeScreen.id,
              );
              break;
          }
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
