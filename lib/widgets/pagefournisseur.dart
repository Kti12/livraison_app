// ignore_for_file: deprecated_member_use, prefer_collection_literals
import 'dart:convert';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:livreur_app/utile/global.colors.dart';
import 'package:livreur_app/widgets/ligne.dart';
import 'package:livreur_app/widgets/profile_user/profile.dart';
import 'package:livreur_app/widgets/map.dart';

class PageFournisseur extends StatefulWidget {
  const PageFournisseur({Key? key}) : super(key: key);

  @override
  State<PageFournisseur> createState() => PageFournisseurState();
}

class PageFournisseurState extends State<PageFournisseur> {
  Future<void> _getCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    var baseUrl = 'http://192.168.10.2:8000/api/set-postionLivreur';
    var response = await http.post(
      Uri.parse(baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'latitude': position.latitude,
        'longitude': position.longitude,
        'user_id': 2,
      }),
    );
    // print(response.body);
    var data = jsonDecode(response.body);
    Fluttertoast.showToast(
      msg: data['message'],
      toastLength: Toast
          .LENGTH_SHORT, // Duration for which the toast should be displayed
      gravity:
          ToastGravity.BOTTOM, // Position of the toast message on the screen
      timeInSecForIosWeb:
          1, // Specific to iOS/Web, the time for which the toast should be displayed
      backgroundColor: Colors.black54, // Background color of the toast
      textColor: Colors.white, // Text color of the toast
      fontSize: 16.0, // Font size of the toast message
    );
  }

  @override
  Widget build(BuildContext context) {
    // return Container(child: Map());

    return Scaffold(
        appBar: AppBar(
          title: const Text('AISA livreur'),
          backgroundColor: const Color(0xFF1C9521),
          leading: const Padding(
            padding: EdgeInsets.all(5),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: AssetImage("assets/Images/aisa_rond.png"),
            ),
          ),
          actions: [
            IconButton(
              // icon: SvgPicture.asset(
              //   'assets/fonts/profile.svg',
              //   color: Colors.white,
              // ),
              icon: const Icon(FluentIcons.settings_32_regular),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Profil()),
                );
                // Action to perform when the profile icon is pressed
              },
            ),
          ],
        ),
        body: Column(children: [
          Expanded(
              child: Stack(
            children: [
              const Map(),
              Positioned(
                bottom: 10,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RoundButton()));
                        _getCurrentLocation();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: GlobalColors.mainColor),
                      child: const Text('En ligne')),
                ),
              )
            ],
          ))
        ]));

    /* showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  topLeft: Radius.circular(25),
                )),
                builder: (BuildContext context) {
                  return SizedBox(
                      height: 400,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              decoration: BoxDecoration(
                                color: const Color(0xFF1C9521),
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(.1),
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const Profil()),
                                  );
                                  
                                },
                                
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF1C9521),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                ),
                                child: const Text(
                                    'Accepter',
                                    style: TextStyle(color: Colors.white),
                                  ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 25),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              decoration: BoxDecoration(
                                color: const Color(0xFF1C9521),
                                borderRadius: BorderRadius.circular(6),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(.1),
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: const Text(
                                'Refuser',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ));
                });
          }, */
  }
}



/* import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

import 'maps.dart';

class Localiser extends StatefulWidget {
  const Localiser({Key? key}) : super(key: key);

  @override
  State<Localiser> createState() => LocaliserState();
} 

class LocaliserState extends State<Localiser> {
  final Completer<GoogleMapController> controller = Completer();

  static const LatLng sourceLocation = LatLng(37.33500926, -122.03272188);
  static const LatLng destination = LatLng(37.33429383, -122.06600055);

  List<LatLng> polylineCoordinates = [];
  LocationData? currentLocation;
  BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor destinationIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor currentLocationIcon = BitmapDescriptor.defaultMarker;

  void getCurrentLocation() async {
    Location location = Location();

    location.getLocation().then(
      (location) {
        currentLocation = location;
      },
    );
    GoogleMapController googleMapController = await controller.future;

    location.onLocationChanged.listen(
      (newLoc) {
        currentLocation = newLoc;

        googleMapController.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
              zoom: 13.5,
              target: LatLng(
                newLoc.latitude!,
                newLoc.longitude!,
              )),
        ));
      },
    );
  }

  void getPolyPoints() async {
    PolylinePoints polylinePoints = PolylinePoints();

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      google_api_key,
      PointLatLng(sourceLocation.latitude, sourceLocation.longitude),
      PointLatLng(destination.latitude, destination.longitude),
    );

    if (result.points.isNotEmpty) {
      result.points.forEach(
        (PointLatLng point) => polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        ),
      );
      setState(() {});
    }
  }
  

  void iniState() {
    getPolyPoints();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Votre position",
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
      body: currentLocation == null
          ? const Center(child: Text("Loading..."))
          : GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(
                    currentLocation!.latitude!, currentLocation!.longitude!),
                zoom: 14.5,
              ),
              polylines: {
                Polyline(
                  polylineId: const PolylineId("Route"),
                  points: polylineCoordinates,
                  color: primaryColor,
                  width: 6,
                )
              },
              markers: {
                Marker(
                    markerId: const MarkerId("currentLocation"),
                    position: LatLng(currentLocation!.latitude!,
                        currentLocation!.longitude!)),
                const Marker(
                  markerId: MarkerId("source"),
                  position: sourceLocation,
                ),
                const Marker(
                  markerId: MarkerId("destination"),
                  position: destination,
                ),
              },
              onMapCreated: (mapController) {
                controller.complete(mapController);
              },
            ),
    );
  }
}
 */ 