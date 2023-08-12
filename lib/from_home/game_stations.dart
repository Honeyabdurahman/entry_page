import 'package:entry_page/main.dart';
import 'package:flutter/material.dart';
import 'package:entry_page/booking/sarahs_shop.dart';
import 'package:entry_page/booking/mountain_traveller.dart';
import 'package:entry_page/booking/safari_shop.dart';


class GameStations extends StatefulWidget {
  const GameStations({super.key});

  @override
  State<GameStations> createState() => _GameStationsState();
}

class _GameStationsState extends State<GameStations> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              MaterialButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => EntryPage(),),);

              },
                child: Icon(Icons.arrow_back_ios, color: Colors.yellow,),
              ),
              Text("Game Stations", style: TextStyle(fontFamily: "Merienda", fontSize: 24.0, fontWeight: FontWeight.bold, decoration: TextDecoration.none, color: Colors.black,),),
            ],
          ),
          Container(
            margin: EdgeInsets.all(22.0),
            height: 300.0,
            width: 400.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: const AssetImage("images/from_home/game_stations/gamers1.jpg"),
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
              padding: EdgeInsets.all(30.0),
              margin: EdgeInsets.all(30.0),
              height: 200.0,
              width: 350.0,
              decoration: BoxDecoration(
                color: Colors.white70,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.lightGreen,),
                      Text("Mt.Rwenzori, Mt.Elgon, ", style: TextStyle(fontSize: 10, decoration: TextDecoration.none, color: Colors.black,),),
                      Container(
                        margin: EdgeInsets.only(left: 5.0,),
                        height: 50.0,
                        width: 130.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(
                            image: const AssetImage("images/from_home/game_stations/gamers1.jpg"),
                            colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.4),
                              BlendMode.srcOver,
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                  Text('The Mountain traveller', style: TextStyle(decoration: TextDecoration.none, color: Colors.black, fontSize: 10),),
                  Text("Lorem Ipsum is simply dummy text of the printing "
                      "and typesetting industry. Lorem Ipsum has been the industry's standard "
                      "dummy text ever since the 1500s, when an unknown printer took", style: TextStyle(decoration: TextDecoration.none, color: Colors.black, fontSize: 10),),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Image(image: AssetImage("images/from_home/game_stations/gamers1map.PNG"),),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: MaterialButton(

                      onPressed: (){
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MountainTraveller()
                          ),
                        );

                      },
                      child: Icon(Icons.arrow_forward_ios, color: Colors.lightGreen,
                      ),
                    ),
                  ),


                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(22.0),
            height: 300.0,
            width: 400.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: const AssetImage("images/from_home/game_stations/gamers2.jpg"),
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
              padding: EdgeInsets.all(30.0),
              margin: EdgeInsets.all(30.0),
              height: 200.0,
              width: 350.0,
              decoration: BoxDecoration(
                color: Colors.white70,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.lightGreen,),
                      Text("Mt.Rwenzori, Mt.Elgon, ", style: TextStyle(fontSize: 10, decoration: TextDecoration.none, color: Colors.black,),),
                      Container(
                        margin: EdgeInsets.only(left: 5.0,),
                        height: 50.0,
                        width: 130.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(
                            image: const AssetImage("images/from_home/game_stations/gamers2.jpg"),
                            colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.4),
                              BlendMode.srcOver,
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                  Text('The Mountain traveller', style: TextStyle(decoration: TextDecoration.none, color: Colors.black, fontSize: 10),),
                  Text("Lorem Ipsum is simply dummy text of the printing "
                      "and typesetting industry. Lorem Ipsum has been the industry's standard "
                      "dummy text ever since the 1500s, when an unknown printer took", style: TextStyle(decoration: TextDecoration.none, color: Colors.black, fontSize: 10),),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Image(image: AssetImage("images/from_home/game_stations/gamers2map.PNG"),),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: MaterialButton(
                      onPressed: (){
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MountainTraveller()
                          ),
                        );

                      },
                      child: Icon(Icons.arrow_forward_ios, color: Colors.lightGreen,
                      ),
                    ),
                  ),


                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(22.0),
            height: 300.0,
            width: 400.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: const AssetImage("images/from_home/game_stations/gamers3.jpg.jpg"),
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
              padding: EdgeInsets.all(30.0),
              margin: EdgeInsets.all(30.0),
              height: 200.0,
              width: 350.0,
              decoration: BoxDecoration(
                color: Colors.white70,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.location_on, color: Colors.lightGreen,),
                      Text("Mt.Rwenzori, Mt.Elgon, ", style: TextStyle(fontSize: 10, decoration: TextDecoration.none, color: Colors.black,),),
                      Container(
                        margin: EdgeInsets.only(left: 5.0,),
                        height: 50.0,
                        width: 130.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(
                            image: const AssetImage("images/from_home/game_stations/gamers3.jpg"),
                            colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.4),
                              BlendMode.srcOver,
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                  Text('The Mountain traveller', style: TextStyle(decoration: TextDecoration.none, color: Colors.black, fontSize: 10),),
                  Text("Lorem Ipsum is simply dummy text of the printing "
                      "and typesetting industry. Lorem Ipsum has been the industry's standard "
                      "dummy text ever since the 1500s, when an unknown printer took", style: TextStyle(decoration: TextDecoration.none, color: Colors.black, fontSize: 10),),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Image(image: AssetImage("images/from_home/game_stations/gamers3map.PNG"),),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: MaterialButton(

                      onPressed: (){
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MountainTraveller()
                          ),
                        );

                      },
                      child: Icon(Icons.arrow_forward_ios, color: Colors.lightGreen,
                      ),
                    ),
                  ),


                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
