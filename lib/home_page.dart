import 'package:flutter/material.dart';
import 'booking.dart';
import 'main.dart';
import 'from_home/game_stations.dart';
import 'from_home/malls.dart';
import 'from_home/fun.dart';
import 'from_home/night_life.dart';
import 'from_home/clubs.dart';
import 'from_home/crafts.dart';
import 'from_home/concerts.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90.0),
        child: HomeAppBar(),
      ),
      body:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Stack(
        children: [
        Container(
          height: 350.0,
          child: Image.asset(
            'images/zoo final.jpg', // Replace with your visually appealing header image
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 16.0,
          left: 16.0,
          child: Text(
            'Uganda: Land of Beauty and Adventure', // Your clear and concise tagline
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        ],
        ),
            const SizedBox(
              height: 28.0,
            ),
            // Banner or Image Carousel


            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'What will you need?',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 5.0),
            Container(
              height: 150.0,
              padding: EdgeInsets.only(right: 20.0),
              child: ListView.builder(
                itemCount: 5,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  // Create a list of images and descriptions for each item
                  List<String> images = [
                    "images/park.jpg",
                    "images/tourshop.jpg",
                    "images/craft.jpg",
                    "images/tourguide.jpg",
                    "images/food.jpg",
                    // Add more image paths for other items
                  ];

                  List<String> descriptions = [
                    "Parks",
                    "Tour shop",
                    "Crafts",
                    "Tourguide",
                    "Food",
                    // Add more descriptions for other items
                  ];

                  return InkWell(
                    onTap: () {},
                    child: Container(
                      width: 100.0,
                      padding: EdgeInsets.all(20.0),
                      margin: EdgeInsets.only(left: 15.0),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(15.0),
                        image: DecorationImage(
                          image: AssetImage(images[index]), // Use the image from the list
                          fit: BoxFit.cover,
                          colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.7),
                            BlendMode.srcOver,
                          ),
                        ),
                      ),
                      child: Container(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          descriptions[index], // Use the description from the list
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Merienda",
                            fontSize: 9.0,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 45.0),
                      height: 70.0,
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7.0),
                        color: Colors.lightGreenAccent,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.white10,
                              blurRadius: 7.0,
                          ),
                        ],
                      ),
                      child: Center(
                          child: Row(
                            children: [
                              Text("Tourguide", style: TextStyle(color: Colors.white, fontFamily: "Merienda",),),
                              MaterialButton(
                                onPressed: (){

                                },
                                  child: Icon(Icons.arrow_forward_ios, color: Colors.white,
                                  ),
                              ),
                            ],
                          ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 45.0),
                      height: 70.0,
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.0),
                          color: Colors.blueGrey,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.white10,
                                blurRadius: 7.0
                            ),
                          ]
                      ),
                      child: Center(
                          child: Row(
                            children: [
                              Text("Find destinations", style: TextStyle(color: Colors.white, fontFamily: "Merienda",),),
                              MaterialButton(
                                onPressed: (){

                                },
                                child: Icon(Icons.arrow_forward_ios, color: Colors.white,
                                ),
                              ),
                            ],
                          )
                      ),

                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 45.0),
                      height: 70.0,
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.0),
                          color: Colors.orange,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.white10,
                                blurRadius: 7.0
                            )
                          ]
                      ),
                      child: Center(
                          child: Row(
                            children: [
                              Text("Want fun?", style: TextStyle(color: Colors.white, fontFamily: "Merienda",),),
                              MaterialButton(
                                onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => FunAreas(),),);

                                },
                                child: Icon(Icons.arrow_forward_ios, color: Colors.white,
                                ),
                              ),
                            ],
                          )
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(left: 45.0),
                      height: 70.0,
                      margin: EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7.0),
                          color: Colors.lightGreen,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.white10,
                                blurRadius: 7.0
                            ),
                          ]
                      ),
                      child: Center(
                          child: Row(
                            children: [
                              Text("Craft shop", style: TextStyle(color: Colors.white, fontFamily: "Merienda",),),
                              MaterialButton(onPressed: () {Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => CraftsPage()), // Replace with your Hotels page widget
                              );
                              },
                                child: Icon(Icons.arrow_forward_ios, color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                      ),

                    ),
                  ),
                ],
              ),
            ),


            // Grid or List of Activities and Events

            SizedBox(height: 32),
            const Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'Explore activities and events',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16),
            // Grid or List of Places and Activities to Explore
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.count(
                crossAxisCount: 1,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _buildGridItem(context, Icons.hotel, 'Hotels', "images/hotel.jpg"),
                  _buildGridItem(context, Icons.park, 'Parks', "images/park.jpg"),
                  _buildGridItem(context, Icons.local_bar, 'Clubs', "images/clubs.jpg"),
                  _buildGridItem(context, Icons.insert_photo_outlined, 'Craft shops', "images/zoos.jpg"),
                  _buildGridItem(context, Icons.nature, 'National Parks', "images/nature.jpg"),
                  _buildGridItem(context, Icons.nightlife, 'Nightlife', "images/nightlife.jpg"),
                  _buildGridItem(context, Icons.museum, 'Amusement Parks', "images/park.jpg"),
                  _buildGridItem(context, Icons.music_note, 'Concerts', "images/concerts.jpg"),
                  _buildGridItem(context, Icons.shopping_bag, 'Malls', "images/malls.jpg"),
                  _buildGridItem(context, Icons.gamepad, 'Game Stations', "images/gamezone.jpg"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridItem(BuildContext context, IconData icon, String title, String imagePath,) {
    return Card(
      child: InkWell(
        onTap: () {
          _navigateToPage(context, title); // Call the navigation function with the title
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imagePath,
              height: 140.0,
              width: 140.0,
            ),
            Icon(icon, size: 30.0),
            SizedBox(height: 8),
            Text(title),
          ],
        ),
      ),
    );
  }

  void _navigateToPage(BuildContext context, String title) {
    switch (title) {
      case 'Hotels':
      // Navigate to the Hotels page
        break;
      case 'Parks':
      // Navigate to the Parks page
        break;
      case 'Clubs':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ClubMap()), // Replace with your Hotels page widget
        );
      // Navigate to the Clubs page
        break;
      case 'Craft shops':
      // Navigate to the Craft shops page
        break;
      case 'National Parks':
      // Navigate to the National Parks page
        break;
      case 'Nightlife':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => NightLife()), // Replace with your Hotels page widget
        );
      // Navigate to the Nightlife page
        break;
      case 'Amusement Parks':
      // Navigate to the Amusement Parks page
        break;
      case 'Concerts':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Concerts()), // Replace with your Hotels page widget
        );
      // Navigate to the Concerts page
        break;
      case 'Malls':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MallView()), // Replace with your Hotels page widget
        );
      // Navigate to the Malls page
        break;
      case 'Game Stations':
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => GameStations()), // Replace with your Hotels page widget
        );
      // Navigate to the Game Stations page
        break;
      default:
      // Handle other cases or show an error message
        break;
    }
  }

}
class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: (){},
            child: Container(
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black,
                      blurRadius: 6.0,
                  ),
                ],
              ),
              child: Icon(
                  Icons.sort_rounded,
              ),
            ),
          ),
          const Row(
            children: [
              Icon(
                Icons.location_on,
                color: Colors.teal,
              ),
              Text("Uganda", style: TextStyle(
                  fontFamily: "Merienda",
                  fontSize: 18.0),
              ),
            ],
          ),
          InkWell(
            onTap: (){

            },
            borderRadius: BorderRadius.circular(12.0),
            child: Container(
              padding: EdgeInsets.all(5.0),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 6.0,
                  ),
                  ],
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Icon(
                Icons.search,
                size: 28.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

