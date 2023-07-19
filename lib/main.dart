import 'package:flutter/material.dart';
import 'home_page.dart';
import 'menu_items.dart';
import 'map_view.dart';
import 'search_page.dart';
import 'booking.dart';

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
        backgroundColor: Colors.white,
        body: pages[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home,
                  color: selectedIndex == 0 ? Colors.teal : Colors.grey),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search,
                  color: selectedIndex == 1 ? Colors.teal : Colors.grey),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map_sharp,
                  color: selectedIndex == 2 ? Colors.teal : Colors.grey),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book_outlined,
                  color: selectedIndex == 3 ? Colors.teal : Colors.grey),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu,
                  color: selectedIndex == 4 ? Colors.teal : Colors.grey),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
