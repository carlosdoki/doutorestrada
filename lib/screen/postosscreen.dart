import 'dart:math';

import 'package:flutter/material.dart';
import 'package:doutorestrada/models/postos_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PostosScreen extends StatefulWidget {
  static String id = 'postos_screen';
  final Postos postos;

  PostosScreen({this.postos});

  @override
  _PostosScreenState createState() => _PostosScreenState();
}

class _PostosScreenState extends State<PostosScreen> {
  Text _buildRatingStars(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐️ ';
    }
    stars.trim();
    return Text(stars);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 6.0,
                    )
                  ],
                ),
                // child: Hero(
                //   tag: widget.postos.url,
                //   child: ClipRRect(
                //     borderRadius: BorderRadius.circular(30.0),
                //     child: Image.network(
                //       widget.noticias.url,
                //       fit: BoxFit.fill,
                //     ),
                //   ),
                // ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 40.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      iconSize: 30.0,
                      color: Colors.black,
                      onPressed: () => Navigator.pop(context),
                    ),
                    Row(
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.search),
                          iconSize: 30.0,
                          color: Colors.black,
                          onPressed: () => Navigator.pop(context),
                        ),
                        IconButton(
                          icon: Icon(FontAwesomeIcons.sortAmountDown),
                          iconSize: 25.0,
                          color: Colors.black,
                          onPressed: () => Navigator.pop(context),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                left: 20.0,
                bottom: 20.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.postos.nome,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 20.0,
                bottom: 20.0,
                child: Icon(
                  Icons.location_on,
                  color: Colors.white70,
                  size: 25.0,
                ),
              )
            ],
          ),
          Expanded(
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          widget.postos.avaliacao.toStringAsFixed(1),
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Expanded(
          //   child: ListView.builder(
          //     padding: EdgeInsets.only(
          //       top: 10.0,
          //       bottom: 15.0,
          //     ),
          //     itemCount: widget.noticias.activities.length,
          //     itemBuilder: (BuildContext context, int index) {
          //       Activity activity = widget.destination.activities[index];
          //       return Stack(
          //         children: <Widget>[
          //           Container(
          //             margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
          //             height: 170.0,
          //             width: double.infinity,
          //             decoration: BoxDecoration(
          //               color: Colors.white,
          //               borderRadius: BorderRadius.circular(20.0),
          //             ),
          //             child: Padding(
          //               padding: EdgeInsets.fromLTRB(100.0, 20.0, 2.0, 2.0),
          //               child: Column(
          //                 mainAxisAlignment: MainAxisAlignment.center,
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: <Widget>[
          //                   Row(
          //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                     crossAxisAlignment: CrossAxisAlignment.start,
          //                     children: <Widget>[
          //                       Container(
          //                         width: 120.0,
          //                         child: Text(
          //                           activity.name,
          //                           style: TextStyle(
          //                             fontSize: 18.0,
          //                             fontWeight: FontWeight.w600,
          //                           ),
          //                           maxLines: 2,
          //                           overflow: TextOverflow.ellipsis,
          //                         ),
          //                       ),
          //                       Column(
          //                         children: <Widget>[
          //                           Text(
          //                             '\$${activity.price}',
          //                             style: TextStyle(
          //                               fontSize: 22.0,
          //                               fontWeight: FontWeight.w600,
          //                             ),
          //                           ),
          //                           Text(
          //                             'per tax',
          //                             style: TextStyle(
          //                               color: Colors.grey,
          //                             ),
          //                           ),
          //                         ],
          //                       ),
          //                     ],
          //                   ),
          //                   Text(
          //                     activity.type,
          //                     style: TextStyle(
          //                       color: Colors.grey,
          //                     ),
          //                   ),
          //                   _buildRatingStars(activity.rating),
          //                   SizedBox(height: 16.0),
          //                   Row(
          //                     children: <Widget>[
          //                       Container(
          //                         padding: EdgeInsets.all(5.0),
          //                         width: 70.0,
          //                         decoration: BoxDecoration(
          //                           color: Theme.of(context).accentColor,
          //                           borderRadius: BorderRadius.circular(10.0),
          //                         ),
          //                         alignment: Alignment.center,
          //                         child: Text(
          //                           activity.startTimes[0],
          //                         ),
          //                       ),
          //                       SizedBox(
          //                         width: 10.0,
          //                       ),
          //                       Container(
          //                         padding: EdgeInsets.all(5.0),
          //                         width: 70.0,
          //                         decoration: BoxDecoration(
          //                           color: Theme.of(context).accentColor,
          //                           borderRadius: BorderRadius.circular(10.0),
          //                         ),
          //                         alignment: Alignment.center,
          //                         child: Text(
          //                           activity.startTimes[1],
          //                         ),
          //                       ),
          //                     ],
          //                   )
          //                 ],
          //               ),
          //             ),
          //           ),
          //           Positioned(
          //             left: 20.0,
          //             top: 15.0,
          //             bottom: 15.0,
          //             child: ClipRRect(
          //               borderRadius: BorderRadius.circular(20.0),
          //               child: Image(
          //                 width: 110.0,
          //                 image: AssetImage(
          //                   activity.imageUrl,
          //                 ),
          //                 fit: BoxFit.cover,
          //               ),
          //             ),
          //           ),
          //         ],
          //       );
          //     },
          //   ),
          // )
        ],
      ),
    );
  }
}
