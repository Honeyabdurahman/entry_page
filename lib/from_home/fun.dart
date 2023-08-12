import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:entry_page/main.dart';

class FunAreas extends StatefulWidget {
  const FunAreas({super.key});

  @override
  State<FunAreas> createState() => _FunAreasState();
}


class _FunAreasState extends State<FunAreas> {
  Set<Marker> _markers = {};

  Future<void> _fetchAndSetMarkers() async {
    final places = GoogleMapsPlaces(apiKey: googleApikey);
    final location = _initialCameraPosition.target;

    final result = await places.searchNearbyWithRadius(
      Location(lat: location.latitude, lng: location.longitude),
      5000, // radius in meters
      type: "amusement park|water park|night club",
    );

    setState(() {
      _markers = result.results.map((place) {
        return Marker(
          markerId: MarkerId(place.placeId),
          position: LatLng(place.geometry!.location.lat, place.geometry!.location.lng),
          infoWindow: InfoWindow(
            title: place.name,
            snippet: place.types?.join(', ') ?? '',
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen), // Change the icon
        );
      }).toSet();
    });
  }

  BuildContext? _scaffoldContext;
  static const String routeName = '/maps';
  String googleApikey = "AIzaSyDVBOdibEyEkPIJD7Ir4zvibiLP_Dh04Ws";
  String location = "Search Location";
  GoogleMapController? mapController;
  static const _initialCameraPosition = CameraPosition(
    target: LatLng(1.2, 32.5), // Set the initial center of the map
    zoom: 7, // Initial zoom level
  );

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
              mapType: MapType.normal,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              initialCameraPosition: _initialCameraPosition,
              markers: _markers,
              // Add other map options and markers based on search query
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
  @override
  void initState() {
    super.initState();
    _fetchAndSetMarkers(); // Fetch and set markers when the widget initializes
  }
}
