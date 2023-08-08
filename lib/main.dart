import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'home_page.dart';
import 'menu_items.dart';
import 'map_view.dart';
import 'search_page.dart';
import 'booking.dart';
import 'start_page.dart';

void main() {
  runApp(EntryPage());
}

class EntryPage extends StatefulWidget {
  const EntryPage({Key? key}) : super(key: key);

  @override
  State<EntryPage> createState() => _EntryPageState();
}

class _EntryPageState extends State<EntryPage> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    HomePage(),
    SearchPage(),
    MapView(),
    BookingPage(),
    MenuPage(),
    // Add other pages here
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.transparent,
        body: pages[selectedIndex],
        bottomNavigationBar: CurvedNavigationBar(
          index: selectedIndex,
          height: 50,
          backgroundColor: Colors.transparent,
          color: Colors.teal,
          buttonBackgroundColor: Colors.teal,
          items: <Widget>[
            Icon(Icons.home, color: Colors.white,),
            Icon(Icons.search, color: Colors.white,),
            Icon(Icons.map_sharp, color: Colors.white,),
            Icon(Icons.book_outlined, color: Colors.white,),
            Icon(Icons.menu, color: Colors.white,),
          ],
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}
class MainPage extends StatefulWidget {
  final int selectedPageIndex; // Add this parameter

  MainPage({required this.selectedPageIndex, Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentPageIndex = 0;
  final List<Widget> pages = [
    HomePage(),
    SearchPage(),
    MapView(),
    BookingPage(),
    MenuPage(),
    // Add other pages here
  ];

  @override
  void initState() {
    super.initState();
    _currentPageIndex = widget.selectedPageIndex; // Set the selected index
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentPageIndex],
      bottomNavigationBar: CurvedNavigationBar(

        index: _currentPageIndex,
        height: 50,
        backgroundColor: Colors.transparent,
        color: Colors.teal,
        buttonBackgroundColor: Colors.teal,
        items: <Widget>[
          Icon(Icons.home, color: Colors.white,),
          Icon(Icons.search, color: Colors.white,),
          Icon(Icons.map_sharp, color: Colors.white,),
          Icon(Icons.book_outlined, color: Colors.white,),
          Icon(Icons.menu, color: Colors.white,),
        ],
        onTap: (index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        // ... rest of your bottom navigation bar code ...
      ),
    );
  }
}
