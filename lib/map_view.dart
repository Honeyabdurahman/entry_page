import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 15.0, right: 20.0, left: 20.0,),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(child: Icon(Icons.person, color: Colors.teal,), backgroundColor: Colors.white,),
              Container(child: Text("Date: 15/07/2023\n Time: 11: 28 AM"),),
              Icon(Icons.search),
            ],
          ),
        ),
        Expanded(
          child: GoogleMap(initialCameraPosition: CameraPosition(
            target: LatLng(37.7748, -122.41942),
            zoom: 12,
          ),),
        ),
        SizedBox(
          height: 10.0,
        )
      ],
    );
  }
}
