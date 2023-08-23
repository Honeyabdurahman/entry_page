import 'package:flutter/material.dart';
//import 'menu/flutterwave_payment.dart';
import 'add_hotel_form.dart';
import 'wishlist_screen.dart';
import 'notification_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Hotel> allHotels = [
    Hotel(
      name: "Karuma Travellers Hotel",
      location: "City Center",
      image: "assets/karumatravellers.jpg",
      price: 180,
      rooms: [
        Room(
          name: "Standard Room",
          image: "assets/room03.jpg",
          price: 100,
          bookingPercentage: 20,
        ),
        // ... (other rooms)
      ],
    ),
    Hotel(
      name: "Chobe Safari Lodge",
      location: "Riverside",
      image: "assets/chobe_safari_lodge.jpg",
      price: 250,
      rooms: [
        Room(
          name: "Standard Room",
          image: "assets/room04.jpg",
          price: 120,
          bookingPercentage: 25,
        ),
        // ... (other rooms)
      ],
    ),
    // ... (other hotels)
  ];

  List<Hotel> displayedHotels = [];

  @override
  void initState() {
    super.initState();
    displayedHotels = List.from(allHotels);
  }

  void filterHotels(String searchTerm) {
    setState(() {
      displayedHotels = allHotels
          .where((hotel) =>
              hotel.name.toLowerCase().contains(searchTerm.toLowerCase()) ||
              hotel.location.toLowerCase().contains(searchTerm.toLowerCase()))
          .toList();
    });
  }

  void _showAddHotelDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AddHotelForm(
          onHotelAdded: (newHotel) {
            setState(() {
              allHotels.add(newHotel);
              displayedHotels.add(newHotel);
            });
            Navigator.pop(context);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hotel Booking'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => NotificationsPage()));
              // Handle notifications
            },
          ),
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => WishlistScreen(wishlist: allHotels),
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 30.0,
                  ),
                  Text('Welcome Back, John!', style: TextStyle(fontSize: 18.0)),
                ],
              ),
              SizedBox(height: 16.0),
              _SearchBar(onSearch: filterHotels),
              SizedBox(height: 16.0),
              Expanded(
                child: ListView.builder(
                  itemCount: displayedHotels.length,
                  itemBuilder: (context, index) {
                    return _HotelCard(hotel: displayedHotels[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddHotelDialog,
        child: Icon(Icons.add),
      ),
    );
  }
}

class _SearchBar extends StatelessWidget {
  final Function(String) onSearch;

  const _SearchBar({Key? key, required this.onSearch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.lightBlue,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: TextField(
        onChanged: onSearch,
        decoration: InputDecoration(
          labelText: 'Search by hotel name or location',
          labelStyle: TextStyle(color: Colors.blue),
          border: OutlineInputBorder(),
        ),
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _HotelCard extends StatefulWidget {
  final Hotel hotel;

  const _HotelCard({Key? key, required this.hotel}) : super(key: key);

  @override
  __HotelCardState createState() => __HotelCardState();
}

class __HotelCardState extends State<_HotelCard> {
  bool _isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              Container(
                height: 250,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.hotel.image),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0),
                  ),
                ),
              ),
              Positioned(
                bottom: 8.0,
                right: 8.0,
                child: Row(
                  children: [
                    Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                    SizedBox(width: 4.0),
                    Text(
                      '${widget.hotel.likes} Loves',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.hotel.name,
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4.0),
                Text(widget.hotel.location),
                SizedBox(height: 8.0),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    SizedBox(width: 4.0),
                    Text(
                      widget.hotel.rating.toString(),
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Text(
                  '\$${widget.hotel.price.toStringAsFixed(2)} / night',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            RoomDetailPage(hotel: widget.hotel),
                      ),
                    );
                  },
                  child: Text('View Rooms'),
                ),
                SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              _isLiked = !_isLiked;
                              if (_isLiked) {
                                widget.hotel.likes++;
                              } else {
                                widget.hotel.likes--;
                              }
                            });
                          },
                          icon: Icon(
                            Icons.thumb_up,
                            color: _isLiked ? Colors.blue : null,
                          ),
                        ),
                        SizedBox(width: 4.0),
                        Text(
                          '${widget.hotel.likes} Likes',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          widget.hotel.isWishListed =
                              !widget.hotel.isWishListed;
                          if (widget.hotel.isWishListed) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Added to wishlist'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          }
                        });
                      },
                      icon: Icon(
                        widget.hotel.isWishListed
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: widget.hotel.isWishListed ? Colors.red : null,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Hotel {
  final String name;
  final String location;
  final String image;
  final double price;
  final List<Room> rooms;
  double rating;
  bool isWishListed;
  int likes;

  Hotel({
    required this.name,
    required this.location,
    required this.image,
    required this.price,
    required this.rooms,
    this.rating = 0.0,
    this.isWishListed = false,
    this.likes = 0,
  });
}

class Room {
  final String name;
  final String image;
  final double price;
  final int bookingPercentage;

  Room({
    required this.name,
    required this.image,
    required this.price,
    required this.bookingPercentage,
  });
}

class RoomDetailPage extends StatelessWidget {
  final Hotel hotel;

  const RoomDetailPage({Key? key, required this.hotel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rooms at ${hotel.name}'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: hotel.rooms.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4.0,
                  child: ListTile(
                    leading: Image.asset(
                      hotel.rooms[index].image,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                    title: Text(hotel.rooms[index].name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '\$${hotel.rooms[index].price.toStringAsFixed(2)} / night',
                        ),
                        Text(
                          'Booking Percentage: ${hotel.rooms[index].bookingPercentage}%',
                        ),
                      ],
                    ),
                    trailing: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                BookingPage(room: hotel.rooms[index]),
                          ),
                        );
                      },
                      child: Text('Select'),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class BookingPage extends StatefulWidget {
  final Room room;

  const BookingPage({Key? key, required this.room}) : super(key: key);

  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  bool _agreeTerms = false;
  int _numRooms = 1;
  int _numDays = 1;
  DateTime _startDate = DateTime.now();
  DateTime _leavingDate = DateTime.now().add(Duration(days: 1));
  bool _accommodation = false;
  bool _feeding = false;
  bool _partying = false;
  bool _otherEvents = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Booking for ${widget.room.name}'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Booking Agreement:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              'This booking serves as an agreement between you and ${widget.room.name}. The amount of the booking fee paid is non-refundable. For more information, please read the terms and conditions. or contact: 0787061200',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Room: ${widget.room.name}',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16.0),
            Text(
              'Price: \$${widget.room.price.toStringAsFixed(2)} / night',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Booking Percentage: ${widget.room.bookingPercentage}%',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Text('Number of Rooms: '),
                DropdownButton<int>(
                  value: _numRooms,
                  onChanged: (value) {
                    setState(() {
                      _numRooms = value!;
                    });
                  },
                  items: List.generate(30, (index) {
                    return DropdownMenuItem<int>(
                      value: index + 1,
                      child: Text((index + 1).toString()),
                    );
                  }),
                ),
              ],
            ),
            Row(
              children: [
                Text('Number of Days: '),
                DropdownButton<int>(
                  value: _numDays,
                  onChanged: (value) {
                    setState(() {
                      _numDays = value!;
                    });
                  },
                  items: List.generate(10, (index) {
                    return DropdownMenuItem<int>(
                      value: index + 1,
                      child: Text((index + 1).toString()),
                    );
                  }),
                ),
              ],
            ),
            Row(
              children: [
                Text('Start Date: '),
                TextButton(
                  onPressed: () async {
                    final selectedDate = await showDatePicker(
                      context: context,
                      initialDate: _startDate,
                      firstDate: DateTime.now(),
                      lastDate: DateTime.now().add(Duration(days: 365)),
                    );
                    if (selectedDate != null) {
                      setState(() {
                        _startDate = selectedDate;
                      });
                    }
                  },
                  child: Text(_startDate.toString().split(' ')[0]),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                    'expected Leaving Date(this date is extendable on aggreement): '),
                TextButton(
                  onPressed: () async {
                    final selectedDate = await showDatePicker(
                      context: context,
                      initialDate: _leavingDate,
                      firstDate: _startDate,
                      lastDate: DateTime.now().add(Duration(days: 365)),
                    );
                    if (selectedDate != null) {
                      setState(() {
                        _leavingDate = selectedDate;
                      });
                    }
                  },
                  child: Text(_leavingDate.toString().split(' ')[0]),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            CheckboxListTile(
              title: Text('Accommodation'),
              value: _accommodation,
              onChanged: (value) {
                setState(() {
                  _accommodation = value!;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Feeding'),
              value: _feeding,
              onChanged: (value) {
                setState(() {
                  _feeding = value!;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Partying'),
              value: _partying,
              onChanged: (value) {
                setState(() {
                  _partying = value!;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Other Events'),
              value: _otherEvents,
              onChanged: (value) {
                setState(() {
                  _otherEvents = value!;
                });
              },
            ),
            CheckboxListTile(
              title: Text('I agree with the terms and conditions'),
              value: _agreeTerms,
              onChanged: (value) {
                setState(() {
                  _agreeTerms = value!;
                });
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (_agreeTerms) {
                  // Perform booking process with the selected options
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return Scaffold(
                          appBar: AppBar(
                            title: Text('Placeholder'),
                          ),
                          body: Center(
                            child: Text('flutter payment'),
                          ),
                        );
                      },
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content:
                          Text('Please agree to the terms and conditions.'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
              },
              child: Text('Book Now'),
            ),
          ],
        ),
      ),
    );
  }
}
