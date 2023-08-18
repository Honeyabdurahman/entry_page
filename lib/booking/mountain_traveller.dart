import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:entry_page/checkout/tourguide_checkout.dart';

class TourguideDetail extends StatefulWidget {
  const TourguideDetail({super.key});

  @override
  State<TourguideDetail> createState() => _TourguideDetailState();
}

class _TourguideDetailState extends State<TourguideDetail> {
  GoogleMapController? mapController;
  static final LatLng _shopLocation = LatLng(0.31, 32.5); // Replace with actual coordinates

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tourguide"),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        children: [
          Expanded(
            child: GoogleMap(
              onMapCreated: (controller) {
                mapController = controller;
              },
              initialCameraPosition: CameraPosition(
                target: _shopLocation,
                zoom: 15.0,
              ),
              markers: {
                Marker(
                  markerId: MarkerId('Johnson'),
                  infoWindow: InfoWindow(title: "Johnson Tours", snippet: "Kitantale road, Kampala"),
                  position: _shopLocation,
                ),
              },
            ),
          ),
          Expanded(
            child: Center(
              child: Container(
                margin: EdgeInsets.all(22.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("images/booking/mountain traveller.jpg"),
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.4),
                      BlendMode.srcOver,
                    ),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 3.0,
                    ),
                  ],
                ),
                child: Container(
                  padding: EdgeInsets.all(25.0),
                  margin: EdgeInsets.all(25.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(Icons.location_on, color: Colors.lightGreen),
                          Text("Kampala, Uganda, ", style: TextStyle(fontSize: 10)),
                          CircleAvatar(
                            foregroundImage: AssetImage("images/tourguide.jpg"),
                          ),
                        ],
                      ),
                      Text("Johnson Tours", style: TextStyle(fontSize: 12.0)),
                      Text(
                        "Certified mountain guide specialized in organizing and leading breathtaking mountain tours.",
                        style: TextStyle(fontSize: 10.0),
                      ),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TourGuideCheckout(
                                  selectedTours: [
                                    TourItem(
                                      name: 'Mountain Expedition',
                                      price: 150.00,
                                      imagePath: 'images/tourguide.jpg',
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.teal,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Row(
                                children: [
                                  Text("Book"),
                                  Icon(Icons.arrow_forward_ios, color: Colors.white),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
