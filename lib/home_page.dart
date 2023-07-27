import 'package:flutter/material.dart';
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
                  _buildGridItem(Icons.hotel, 'Hotels', "images/hotel.jpg"),
                  _buildGridItem(Icons.park, 'Parks', "images/park.jpg"),
                  _buildGridItem(Icons.local_bar, 'Clubs', "images/clubs.jpg"),
                  _buildGridItem(Icons.insert_photo_outlined, 'Craft shops', "images/zoos.jpg"),
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

