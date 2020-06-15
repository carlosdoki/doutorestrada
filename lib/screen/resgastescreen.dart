import 'package:flutter/material.dart';

class RegastesScreen extends StatefulWidget {
  static String id = 'resgastes';

  @override
  _RegastesScreenState createState() => _RegastesScreenState();
}

class _RegastesScreenState extends State<RegastesScreen> {
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
                children: <Widget>[Text('Resgaste')],
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
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
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
                  height: 150,
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
                              Row(
                                children: <Widget>[
                                  Container(
                                    height: 60.0,
                                    width: 60.0,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black26,
                                            offset: Offset(0, 2),
                                            blurRadius: 6.0,
                                          ),
                                        ],
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/truck_check.png'),
                                        )),
                                  ),
                                  Container(
                                    height: 60.0,
                                    width: 60.0,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black26,
                                            offset: Offset(0, 2),
                                            blurRadius: 6.0,
                                          ),
                                        ],
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/truck_check.png'),
                                        )),
                                  ),
                                  Container(
                                    height: 60.0,
                                    width: 60.0,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black26,
                                            offset: Offset(0, 2),
                                            blurRadius: 6.0,
                                          ),
                                        ],
                                        image: DecorationImage(
                                          image: AssetImage(
                                              'assets/truck_check.png'),
                                        )),
                                  ),
                                  Container(
                                    height: 60.0,
                                    width: 60.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black26,
                                          offset: Offset(0, 2),
                                          blurRadius: 6.0,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
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
