import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'main.dart';

class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<MapView> createState() => _MapViewState();
}
BuildContext? _scaffoldContext;
void _onMarkerTapped(String markerId) {
  if (_scaffoldContext != null) {
    Navigator.push(
      _scaffoldContext!,
      MaterialPageRoute(builder: (context) => MarkerDetailsPage(markerId: markerId)),
    );
  }
}



class _MapViewState extends State<MapView> {

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
      markerId: MarkerId('Queen Elizabeth NP'),
      position: LatLng(0.8, 30.2),
      infoWindow: InfoWindow(title: 'Queen Elizabeth National park', snippet: 'Explore the diverse Savannah habitants..',),
      onTap: () {
      },
    ),
    Marker(
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      markerId: MarkerId('Murchison Falls NP'),
      position: LatLng(2.21, 31.7),
      infoWindow: InfoWindow(title: 'Murchsion Falls National park', snippet: 'Crocdile Sanctuary'),
      onTap: () {
      },
    ),
    Marker(
      markerId: MarkerId("Sarah's Craft shop"),
      position: LatLng(0.31, 30.08),
      infoWindow: InfoWindow(title: "Sarah's Craft shop", snippet: 'Diverse plethora of Ugandan craft'),
      onTap: () {
      },
    ),
    Marker(
      markerId: MarkerId('Hotel Triangle'),
      position: LatLng(0.31, 32.5),
      infoWindow: InfoWindow(title: 'Hotel Triangle, blvd avenue', snippet: 'Feel at home..'),
      onTap: () {
      },
    ),
    // Add more markers as needed
  ];



  @override
  @override
  Widget build(BuildContext context) {
    return Column(
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
        Positioned( //search input bar
          top: 10,
          child: InkWell(
            onTap: () async {
              var place = await PlacesAutocomplete.show(
                  context: context,
                  apiKey: googleApikey,
                  mode: Mode.overlay,
                  types: [],
                  strictbounds: false,
                  components: [Component(Component.country, 'np')],
                  //google_map_webservice package
                  onError: (err) {
                    print(err);
                  }
              );

              if (place != null) {
                setState(() {
                  location = place.description.toString();
                });

                //form google_maps_webservice package
                final plist = GoogleMapsPlaces(apiKey: googleApikey,
                  apiHeaders: await GoogleApiHeaders().getHeaders(),
                  //from google_api_headers package
                );
                String placeid = place.placeId ?? "0";
                final detail = await plist.getDetailsByPlaceId(placeid);
                final geometry = detail.result.geometry!;
                final lat = geometry.location.lat;
                final lang = geometry.location.lng;
                var newlatlang = LatLng(lat, lang);


                //move map camera to selected place with animation
                mapController?.animateCamera(CameraUpdate.newCameraPosition(
                    CameraPosition(target: newlatlang, zoom: 17)));
              }
            },
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Card(
                child: Container(
                    padding: EdgeInsets.all(0),
                    width: MediaQuery
                        .of(context)
                        .size
                        .width - 40,
                    child: ListTile(
                      title: Text(location, style: TextStyle(fontSize: 18),),
                      trailing: Icon(Icons.search),
                      dense: true,
                    )
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
      ],
    );
  }
}

class MarkerDetailsPage extends StatelessWidget {
  final String markerId;

  const MarkerDetailsPage({required this.markerId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Marker Details')),
      body: Center(
        child: Text('Details for marker with ID: $markerId'),
      ),
    );
  }
}
