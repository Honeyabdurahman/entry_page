import 'package:flutter/material.dart';
import 'package:entry_page/checkout/craftscheckout.dart';

class CraftsPage extends StatefulWidget {
  @override
  _CraftsPageState createState() => _CraftsPageState();
}

class _CraftsPageState extends State<CraftsPage> {
  final List<CraftItem> craftsList = [
    CraftItem(
      name: 'Handcrafted Wooden Bowl',
      price: 25.99,
      imagePath: 'images/crafts/woodenbowl.webp',
    ),
    CraftItem(
      name: 'Colorful Beaded Necklace',
      price: 15.49,
      imagePath: 'images/crafts/beadednecklace.jpg',
    ),
    CraftItem(
      name: 'Artisan Clay Mug',
      price: 18.75,
      imagePath: 'images/crafts/claymug.webp',
    ),
    // Add more craft items to the list
  ];

  List<CraftItem> cartItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crafts for Purchase'),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        itemCount: craftsList.length,
        itemBuilder: (context, index) {
          final craftItem = craftsList[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(craftItem.imagePath),
            ),
            title: Text(craftItem.name),
            subtitle: Text('\$${craftItem.price.toStringAsFixed(2)}'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      cartItems.add(craftItem);
                    });
                  },
                  child: Text('Add to Cart'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal, // Set background color
                  ),
                ),
                SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    // Handle the book action
                    // You can navigate to a booking page or show a booking dialog
                    // based on your application's requirements.
                    // Here, let's just show a SnackBar to indicate booking.
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Item booked: ${craftItem.name}')),
                    );
                  },
                  child: Text('Book'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.teal, // Set background color
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: cartItems.isNotEmpty
          ? FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CraftsCheckout(cartItems: cartItems),),);
          // Handle cart checkout
          // You can navigate to a cart checkout page
          // or show a summary dialog based on your application's requirements.
        },
        label: Text('View Cart (${cartItems.length})'),
        icon: Icon(Icons.shopping_cart),
        backgroundColor: Colors.teal,
      )
          : null,
    );
  }
}

class CraftItem {
  final String name;
  final double price;
  final String imagePath;

  CraftItem({required this.name, required this.price, required this.imagePath});
}
