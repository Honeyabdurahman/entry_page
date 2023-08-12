import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:entry_page/main.dart';

class NightLife extends StatefulWidget {
  const NightLife({super.key});

  @override
  State<NightLife> createState() => _NightLifeState();
}

class _NightLifeState extends State<NightLife> {

  BuildContext? _scaffoldContext;
  static const String routeName = '/maps';
  String googleApikey = "AIzaSyDVBOdibEyEkPIJD7Ir4zvibiLP_Dh04Ws";
  String location = "Search Location";
  GoogleMapController? mapController;
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(1.2, 32.5), // Set the initial center of the map
    zoom: 7, // Initial zoom level
  );

  List<Marker> markers = [
    Marker(
      markerId: MarkerId('Marriot party'),
      position: LatLng(0.60, 30.68),
      infoWindow: InfoWindow(title: 'Marriot party', snippet: 'Pool party',),
      onTap: () {
      },
    ),
    Marker(
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      markerId: MarkerId('Mutoni grills'),
      position: LatLng(1.07, 34.18),
      infoWindow: InfoWindow(title: 'Mutoni grills', snippet: 'All kinds of grills and drinks'),
      onTap: () {
      },
    ),
    Marker(
      markerId: MarkerId("Shiska club"),
      position: LatLng(0.31, 32.61),
      infoWindow: InfoWindow(title: "Shiska", snippet: 'Live it up'),
      onTap: () {
      },
    ),
    Marker(
      markerId: MarkerId("Ambiance Night concert"),
      position: LatLng(0.31, 32.5),
      infoWindow: InfoWindow(title: "Ambiance Night concert", snippet: 'Artists: Kelly, Ntale, and Musa'),
      onTap: () {
      },
    ),
    // Add more markers as needed
  ];



  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clubs map'),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 15.0, right: 20.0, left: 20.0,),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(child: Icon(Icons.person, color: Colors.teal,),
                  backgroundColor: Colors.white,),
                Container(child: Text("Date: 15/07/2023\n Time: 11: 28 AM"),),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Expanded(
            child: GoogleMap(
              markers: Set<Marker>.of(markers),
              mapType: MapType.normal,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              initialCameraPosition: _initialCameraPosition,
              // Add other map options and markers based on search query
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: markers.length,
              itemBuilder: (context, index) {
                final marker = markers[index];
                return ListTile(
                  leading: Icon(Icons.location_pin),
                  title: Text(marker.infoWindow.title ?? ''),
                  subtitle: Text(marker.infoWindow.snippet ?? ''),
                  onTap: () {
                    // Handle marker tap, e.g., navigate to a different page
                  },
                );
              },
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}