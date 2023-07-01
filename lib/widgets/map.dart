// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  late double long = 0.0;
  late double lat = 0.0;
  late bool isCenter = false;
  late LatLng _center = LatLng(lat, long);
  MapController _mapController = MapController();

  @override
  void initState() {
    super.initState();
    startPositionUpdate();
  }

  void startPositionUpdate() {
    Timer.periodic(Duration(seconds: 3), (Timer timer) {
      setPositionUser();
      
      // actualiser le changement de position chaque 3 secondes
    });
  }

  void setPositionUser() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    print(position);
    setState(() {
      lat = position.latitude;
      long = position.longitude;
      _center = LatLng(lat, long);
      if (!isCenter) {
        _mapController.move(_center, 13);
        isCenter = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      mapController: _mapController,
      options: MapOptions(
        center: _center,
        zoom: 13.0,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          subdomains: ['a', 'b', 'c'],
        ),
        MarkerLayer(markers: [
          Marker(
            width: 40.0,
            height: 40.0,
            point: LatLng(lat, long),
            builder: (ctx) => const Image(
                    image: AssetImage("assets/fonts/localisation.png"),
                    color: Colors.red,
                  )
          ),
        ]),
      ],
    );
  }
}
