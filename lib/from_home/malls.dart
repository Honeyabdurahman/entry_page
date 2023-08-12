import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:entry_page/main.dart';

class MallView extends StatefulWidget {
  const MallView({super.key});

  @override
  State<MallView> createState() => _MallViewState();
}



class _MallViewState extends State<MallView> {

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
      markerId: MarkerId('Palm mall'),
      position: LatLng(0.38, 30.07),
      infoWindow: InfoWindow(title: 'Palm mall NEW', snippet: 'For all your utilities and needs',),
      onTap: () {
      },
    ),
    Marker(
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      markerId: MarkerId('Naramat'),
      position: LatLng(0.21, 32.3),
      infoWindow: InfoWindow(title: 'Naramat mall, East Havol', snippet: 'We offer..'),
      onTap: () {
      },
    ),
    Marker(
      markerId: MarkerId("Jessi mall"),
      position: LatLng(0.31, 32.7),
      infoWindow: InfoWindow(title: "Jessi mall, ", snippet: 'Diverse plethora of Ugandan craft'),
      onTap: () {
      },
    ),
    Marker(
      markerId: MarkerId('Colt mall'),
      position: LatLng(0.31, 32.5),
      infoWindow: InfoWindow(title: 'Colt, blvd avenue', snippet: 'Quality guarranteed'),
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
        title: const Text('Mall map'),
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