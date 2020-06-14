import 'dart:math';

import 'package:flutter/material.dart';
import 'package:doutorestrada/models/postos_model.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PostosScreen extends StatefulWidget {
  static String id = 'postos_screen';
  final Postos postos;

  PostosScreen({this.postos});

  @override
  _PostosScreenState createState() => _PostosScreenState();
}

class _PostosScreenState extends State<PostosScreen> {
  bool isSwitched = true;
  GoogleMapController mapController;

  // final LatLng _center = const LatLng(45.521563, -122.677433);
  //  latitude: -22.5604362,
  //  longitude: -44.1435899,
  // final LatLng _center =
  //     LatLng(postos.latitude, postos.latitude);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

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
    var _center = LatLng(widget.postos.latitude, widget.postos.longitude);

    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF366D83),
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
                  vertical: 30.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.close),
                      iconSize: 30.0,
                      color: Colors.black,
                      onPressed: () => Navigator.pop(context),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context)
                    .size
                    .width, // or use fixed size like 200
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.only(top: 80),
                  child: GoogleMap(
                    mapType: MapType.normal,
                    initialCameraPosition:
                        CameraPosition(target: _center, zoom: 15),
                  ),
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
                        fontSize: 25.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                      ),
                      maxLines: 2,
                      softWrap: true,
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
                  margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Container(
                      margin: EdgeInsets.zero,
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Text(
                                widget.postos.avaliacao.toStringAsFixed(1),
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                              _buildRatingStars(
                                  widget.postos.avaliacao.round()),
                              SizedBox(
                                width: 60.0,
                              ),
                              Text(
                                'Favorito',
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                              Switch(
                                value: true,
                                onChanged: (value) {
                                  setState(() {
                                    isSwitched = value;
                                  });
                                },
                                activeTrackColor: Colors.lightGreenAccent,
                                activeColor: Colors.green,
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Checkbox(
                                value: true,
                                onChanged: null,
                              ),
                              Text(
                                'Estacionamento',
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Checkbox(
                                value: true,
                                onChanged: null,
                              ),
                              Text(
                                'Area de descanço',
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Checkbox(
                                value: true,
                                onChanged: null,
                              ),
                              Text(
                                'Restaurante',
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Checkbox(
                                value: true,
                                onChanged: null,
                              ),
                              Text(
                                'Hotel',
                                style: TextStyle(
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
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
