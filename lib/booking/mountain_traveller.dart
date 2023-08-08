import 'package:flutter/material.dart';
import 'package:entry_page/main.dart';

class MountainTraveller extends StatefulWidget {
  const MountainTraveller({super.key});

  @override
  State<MountainTraveller> createState() => _MountainTravellerState();
}

class _MountainTravellerState extends State<MountainTraveller> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: MaterialButton(
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EntryPage(),
                  ),
                );
              },
              child: Icon(Icons.arrow_back_ios, color: Colors.red,),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.all(22.0),
              height: 480.0,
              width: 500.0,
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
                padding: EdgeInsets.all(30.0),
                margin: EdgeInsets.all(30.0),
                height: 200.0,
                width: 350.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.lightGreen,),
                        Text("Mt.Rwenzori, Mt.Elgon, ", style: TextStyle(fontSize: 10.0,),),
                        CircleAvatar(
                          child: Image.asset("images/booking/mountain traveller.jpg"),
                              ),
                      ],
                    ),
                    Text("Sarah's Craft shop", style: TextStyle(fontSize: 15.0),),
                    Text("Lorem Ipsum is simply dummy text of the printing "
                        "and typesetting industry. Lorem Ipsum has been the industry's standard "
                        "dummy text ever since the 1500s, when an unknown printer took", style: TextStyle(fontSize: 12.0,),),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: MaterialButton(

                        onPressed: (){

                        },
                        child: Icon(Icons.arrow_forward_ios, color: Colors.lightGreen,
                        ),
                      ),
                    ),


                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
