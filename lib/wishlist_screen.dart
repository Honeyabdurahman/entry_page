import 'package:flutter/material.dart';
import 'home_screen.dart'; // Import your Hotel class from the existing code

class WishlistScreen extends StatefulWidget {
  final List<Hotel> wishlist;

  WishlistScreen({required this.wishlist});

  @override
  _WishlistScreenState createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  void _removeFromWishlist(int index) {
    setState(() {
      widget.wishlist.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Wishlist'),
      ),
      body: ListView.builder(
        itemCount: widget.wishlist.length,
        itemBuilder: (context, index) {
          return _WishlistItem(
            hotel: widget.wishlist[index],
            onRemove: () => _removeFromWishlist(index),
          );
        },
      ),
    );
  }
}

class _WishlistItem extends StatelessWidget {
  final Hotel hotel;
  final VoidCallback onRemove;

  const _WishlistItem({Key? key, required this.hotel, required this.onRemove})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: ListTile(
        leading: Image.asset(
          hotel.image,
          width: 100,
          height: 100,
          fit: BoxFit.cover,
        ),
        title: Text(hotel.name),
        subtitle: Text(hotel.location),
        trailing: IconButton(
          onPressed: onRemove,
          icon: Icon(Icons.delete),
        ),
      ),
    );
  }
}
