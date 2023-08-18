import 'package:flutter/material.dart';
import "booking/sarahs_shop.dart";
import 'booking/mountain_traveller.dart';
import 'booking/safari_shop.dart';


class BookingPage extends StatefulWidget {
  const BookingPage({super.key});

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text("Craft Shops", style: TextStyle(fontFamily: "Merienda", fontSize: 24.0, fontWeight: FontWeight.bold,),),
          Container(
            margin: EdgeInsets.all(22.0),
            height: 300.0,
            width: 400.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("images/craftshop.jpg"),
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
                      Text("Mt.Rwenzori, Mt.Elgon, ", style: TextStyle(fontSize: 10,),),
                      Container(
                        margin: EdgeInsets.only(left: 5.0,),
                        height: 50.0,
                        width: 130.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(
                            image: AssetImage("images/craftshop.jpg"),
                            colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.4),
                              BlendMode.srcOver,
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                  Text("Sarah's Craft shop",),
                  Text("Lorem Ipsum is simply dummy text of the printing "
                      "and typesetting industry. Lorem Ipsum has been the industry's standard "
                      "dummy text ever since the 1500s, when an unknown printer took", ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SarahsShop(),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.lightGreen,
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
                image: const AssetImage("images/booking/safari shop.jpg"),
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
                      Text("Mt.Rwenzori, Mt.Elgon, ", style: TextStyle(fontSize: 10,),),
                      Container(
                        margin: EdgeInsets.only(left: 5.0,),
                        height: 50.0,
                        width: 130.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(
                            image: const AssetImage("images/booking/safari shop.jpg"),
                            colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.4),
                              BlendMode.srcOver,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text('Safari shop',),
                  Text("Lorem Ipsum is simply dummy text of the printing "
                      "and typesetting industry. Lorem Ipsum has been the industry's standard "
                      "dummy text ever since the 1500s, when an unknown printer took", ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: MaterialButton(

                      onPressed: (){
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SafariShop(),
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
          Text("Get a Tour guide", style: TextStyle(fontFamily: "Merienda", fontSize: 24.0, fontWeight: FontWeight.bold,),),
          Container(
            margin: EdgeInsets.all(22.0),
            height: 300.0,
            width: 400.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: const AssetImage("images/booking/mountain traveller.jpg"),
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
                      Text("Mt.Rwenzori, Mt.Elgon, ", style: TextStyle(fontSize: 10,),),
                      Container(
                        margin: EdgeInsets.only(left: 5.0,),
                        height: 50.0,
                        width: 130.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(
                            image: const AssetImage("images/booking/mountain traveller.jpg"),
                            colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.4),
                              BlendMode.srcOver,
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                  Text('The Mountain traveller',),
                  Text("Lorem Ipsum is simply dummy text of the printing "
                      "and typesetting industry. Lorem Ipsum has been the industry's standard "
                      "dummy text ever since the 1500s, when an unknown printer took", ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: MaterialButton(

                      onPressed: (){
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => TourguideDetail()
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
                image: const AssetImage("images/booking/mountain traveller.jpg"),
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
                      Text("Mt.Rwenzori, Mt.Elgon, ", style: TextStyle(fontSize: 10,),),
                      Container(
                        margin: EdgeInsets.only(left: 5.0,),
                        height: 50.0,
                        width: 130.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          image: DecorationImage(
                            image: const AssetImage("images/booking/mountain traveller.jpg"),
                            colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.4),
                              BlendMode.srcOver,
                            ),
                          ),
                        ),
                      ),

                    ],
                  ),
                  Text('The Mountain traveller',),
                  Text("Lorem Ipsum is simply dummy text of the printing "
                      "and typesetting industry. Lorem Ipsum has been the industry's standard "
                      "dummy text ever since the 1500s, when an unknown printer took", ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: MaterialButton(

                      onPressed: (){
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => TourguideDetail()
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
