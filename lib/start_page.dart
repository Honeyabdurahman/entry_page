import 'package:flutter/material.dart';
import 'main.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: PageView(
          controller: _pageController,
          children: [
            StartPageItem(image: 'images/craft.jpg', text: 'Discover'),
            StartPageItem(image: 'images/tourshop.jpg', text: 'Explore'),
            StartPageItem(image: 'images/tourguide.jpg', text: 'Adventure'),
          ],
        ),
        bottomNavigationBar: AnimatedSmoothIndicator(
          activeIndex: _currentPage,
          count: 3,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => EntryPage()),
            );
          },
          child: Icon(Icons.arrow_forward),
        ),
      ),
    );
  }
}

class StartPageItem extends StatelessWidget {
  final String image;
  final String text;

  const StartPageItem({required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image),
          SizedBox(height: 20),
          Text(
            text,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedSmoothIndicator extends StatelessWidget {
  final int activeIndex;
  final int count;

  AnimatedSmoothIndicator({required this.activeIndex, required this.count});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        count,
            (index) => Container(
          width: 8,
          height: 8,
          margin: EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index == activeIndex ? Colors.teal : Colors.grey,
          ),
        ),
      ),
    );
  }
}
