import 'package:flutter/material.dart';
import 'home_screen.dart'; // Import your Hotel and Room models

class AddHotelForm extends StatefulWidget {
  final Function(Hotel) onHotelAdded;

  const AddHotelForm({Key? key, required this.onHotelAdded}) : super(key: key);

  @override
  _AddHotelFormState createState() => _AddHotelFormState();
}

class _AddHotelFormState extends State<AddHotelForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  final List<Room> _rooms = [];

  void addRoom(Room room) {
    setState(() {
      _rooms.add(room);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add New Hotel'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Hotel Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a name';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _locationController,
              decoration: InputDecoration(labelText: 'Location'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a location';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _imageController,
              decoration: InputDecoration(labelText: 'Image'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an image URL';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Price'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a price';
                }
                return null;
              },
            ),
            // Add more form fields as needed
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AddRoomForm(
                    onRoomAdded: addRoom,
                  ),
                );
              },
              child: Text('Add Room'),
            ),
            // Display added rooms
            if (_rooms.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10),
                  Text('Added Rooms:'),
                  Column(
                    children: _rooms.map((room) {
                      return ListTile(
                        title: Text(room.name),
                        subtitle: Text('\$${room.price.toStringAsFixed(2)}'),
                      );
                    }).toList(),
                  ),
                ],
              ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              final newHotel = Hotel(
                name: _nameController.text,
                location: _locationController.text,
                image: _imageController.text,
                price: double.parse(_priceController.text),
                rooms: _rooms,
              );
              widget.onHotelAdded(newHotel);
              Navigator.pop(context);
            }
          },
          child: Text('Add'),
        ),
      ],
    );
  }
}

class AddRoomForm extends StatefulWidget {
  final Function(Room) onRoomAdded;

  const AddRoomForm({Key? key, required this.onRoomAdded}) : super(key: key);

  @override
  _AddRoomFormState createState() => _AddRoomFormState();
}

class _AddRoomFormState extends State<AddRoomForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Add New Room'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Room Name'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a name';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _imageController,
              decoration: InputDecoration(labelText: 'Image'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter an image URL';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Price'),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a price';
                }
                return null;
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              final newRoom = Room(
                name: _nameController.text,
                image: _imageController.text,
                price: double.parse(_priceController.text),
                bookingPercentage: 0,
              );
              widget.onRoomAdded(newRoom);
              Navigator.pop(context);
            }
          },
          child: Text('Add'),
        ),
      ],
    );
  }
}
