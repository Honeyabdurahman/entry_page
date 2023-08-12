import 'package:flutter/material.dart';

class ClubDetail extends StatefulWidget {
  const ClubDetail({super.key});

  @override
  State<ClubDetail> createState() => _ClubDetailState();
}

class _ClubDetailState extends State<ClubDetail> {
  bool isBooking = false; // State variable to manage booking process

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Club'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300.0,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/clubs.jpg"),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Club Name",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star, color: Colors.yellow),
                      Icon(Icons.star_half, color: Colors.yellow),
                      SizedBox(width: 5.0),
                      Text("4.5 (300 reviews)"),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "Working Hours: 8:00 PM - 2:00 AM",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    "About Us",
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque eget pellentesque erat. Etiam varius ex at urna elementum, eget porttitor leo rhoncus.",
                  ),
                  SizedBox(height: 20.0),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isBooking = true; // Start booking process
                      });
                    },
                    child: Text("Book Now"),
                  ),
                  if (isBooking)
                    Column(
                      children: [
                        SizedBox(height: 20.0),
                        Text(
                          "Select the number of individuals:",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10.0),
                        // Replace this with your booking widget, e.g., dropdown or stepper
                        // Example: DropdownButton<int>(
                        //   value: selectedCount,
                        //   onChanged: (value) {
                        //     setState(() {
                        //       selectedCount = value;
                        //     });
                        //   },
                        //   items: [1, 2, 3, 4, 5].map((count) {
                        //     return DropdownMenuItem<int>(
                        //       value: count,
                        //       child: Text("$count Individuals"),
                        //     );
                        //   }).toList(),
                        // ),
                        SizedBox(height: 20.0),
                        ElevatedButton(
                          onPressed: () {
                            // Process booking logic here
                          },
                          child: Text("Confirm Booking"),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
