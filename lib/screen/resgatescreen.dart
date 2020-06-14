import 'package:flutter/material.dart';

class ResgateScreen extends StatefulWidget {
  static const String id = 'resgatescreen.dart';
  @override
  _ResgateScreenState createState() => _ResgateScreenState();
}

class _ResgateScreenState extends State<ResgateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Color(0xFF366D83),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          iconSize: 28.0,
          onPressed: () {
            Navigator.pop(context);
          },
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
              padding: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Color(0xFF366D83),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Text(
                    ' Posto 1',
                    style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    'Resgate de Pontos',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: ListView(
                        children: <Widget>[
                          ListTile(
                            title: Text('Vale Banho'),
                            trailing: Checkbox(value: false, onChanged: null),
                          ),
                          ListTile(
                            title: Text('Vale Estacionamento'),
                            trailing: Checkbox(value: false, onChanged: null),
                          ),
                          ListTile(
                            title: Text('Vale Refeição'),
                            trailing: Checkbox(value: false, onChanged: null),
                          ),
                          ListTile(
                            title: Text('Vale Lava-Rápido'),
                            trailing: Checkbox(value: false, onChanged: null),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
