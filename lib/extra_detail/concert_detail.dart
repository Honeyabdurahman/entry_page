import 'package:flutter/material.dart';

class ConcertBookingPage extends StatefulWidget {
  const ConcertBookingPage({Key? key}) : super(key: key);

  @override
  _ConcertBookingPageState createState() => _ConcertBookingPageState();
}

class _ConcertBookingPageState extends State<ConcertBookingPage> {
  bool isBooking = false;
  int selectedTickets = 1; // Initially set to 1 ticket

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Concert Booking'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome to the Concert Booking Page',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Image.asset('images/concerts.jpg', width: 300, height: 200),
            SizedBox(height: 20),
            Text(
              'Concert Details:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text('Concert Name: Awesome Concert'),
            Text('Date: July 15, 2023'),
            Text('Time: 8:00 PM'),
            SizedBox(height: 20),
            if (isBooking)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Select the number of tickets:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  DropdownButton<int>(
                    value: selectedTickets,
                    onChanged: (value) {
                      setState(() {
                        selectedTickets = value!;
                      });
                    },
                    items: [1, 2, 3, 4, 5]
                        .map((count) => DropdownMenuItem<int>(
                      value: count,
                      child: Text('$count Tickets'),
                    ))
                        .toList(),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Process booking logic here
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Booking Confirmed'),
                          content: Text(
                              'You have successfully booked $selectedTickets tickets.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('OK'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Text('Confirm Booking'),
                  ),
                ],
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  isBooking = !isBooking;
                });
              },
              child: Text(isBooking ? 'Cancel Booking' : 'Book Tickets'),
            ),
          ],
        ),
      ),
    );
  }
}
