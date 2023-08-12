import 'package:flutter/material.dart';
import 'package:entry_page/from_home/crafts.dart';

class CraftsCheckout extends StatelessWidget {
  final List<CraftItem> cartItems;

  CraftsCheckout({required this.cartItems});

  @override
  Widget build(BuildContext context) {
    double totalAmount = cartItems.map((item) => item.price).reduce((sum, price) => sum + price);

    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Items in Cart:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            ListView.builder(
              shrinkWrap: true,
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final cartItem = cartItems[index];
                return ListTile(
                  title: Text(cartItem.name),
                  subtitle: Text('\$${cartItem.price.toStringAsFixed(2)}'),
                );
              },
            ),
            SizedBox(height: 20),
            Text(
              'Total Amount: \$${totalAmount.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle the payment process here
                // You can navigate to the payment gateway or show a payment dialog
                // based on your application's requirements.
              },
              child: Text('Proceed to Payment'),
              style: ElevatedButton.styleFrom(
                primary: Colors.teal, // Set background color
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
