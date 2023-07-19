import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tour & Fun Guide'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner or Image Carousel
            Container(
              height: 200.0,
              child: Image.asset(
                'images/banner.jpg',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Interesting Activities and Events',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16),
            // Grid or List of Activities and Events
            Container(
              height: 200, // Adjust the height as per your requirement
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10, // Replace with the actual number of activities/events
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text('Activity/Event $index'),
                      subtitle: Text('Location: City, Country'),
                      // Add any other relevant details or widgets here
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Explore More',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16),
            // Grid or List of Places and Activities to Explore
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _buildGridItem(Icons.hotel, 'Hotels', "images/hotel.jpg"),
                  _buildGridItem(Icons.park, 'Parks', "images/park.jpg"),
                  _buildGridItem(Icons.local_bar, 'Clubs', "images/clubs.jpg"),
                  _buildGridItem(Icons.catching_pokemon, 'Zoos', "images/zoos.jpg"),
                  _buildGridItem(Icons.nature, 'National Parks', "images/nature.jpg"),
                  _buildGridItem(Icons.nightlife, 'Nightlife', "images/nightlife.jpg"),
                  _buildGridItem(Icons.museum, 'Amusement Parks', "images/park.jpg"),
                  _buildGridItem(Icons.music_note, 'Concerts', "images/concerts.jpg"),
                  _buildGridItem(Icons.shopping_bag, 'Malls', "images/malls.jpg"),
                  _buildGridItem(Icons.gamepad, 'Game Stations', "images/gamezone.jpg"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(IconData icon, String title, String imagePath,) {
    return Card(
      child: InkWell(
        onTap: () {
          // Handle the tap on each grid item
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: 80,
              width: 80,
            ),
            Icon(icon, size: 48),
            SizedBox(height: 8),
            Text(title),
          ],
        ),
      ),
    );
  }
}
