import 'package:flutter/material.dart';

class TourGuideCheckout extends StatelessWidget {
  final List<TourItem> selectedTours; // List of selected tours

  TourGuideCheckout({required this.selectedTours});

  @override
  Widget build(BuildContext context) {
    double totalAmount = selectedTours.fold(0, (sum, item) => sum + item.price);

    return Scaffold(
      appBar: AppBar(
        title: Text('Tour Guide Checkout'),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Selected Tours:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: selectedTours.length,
                itemBuilder: (context, index) {
                  final tourItem = selectedTours[index];
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(tourItem.imagePath),
                    ),
                    title: Text(tourItem.name),
                    subtitle: Text('\$${tourItem.price.toStringAsFixed(2)}'),
                  );
                },
              ),
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Total Amount:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 10),
                Text(
                  '\$$totalAmount',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement your payment logic here
                // You can navigate to a payment gateway or show a confirmation dialog
              },
              child: Text('Proceed to Payment'),
              style: ElevatedButton.styleFrom(
                primary: Colors.teal, // Set background color
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                textStyle: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TourItem {
  final String name;
  final double price;
  final String imagePath;

  TourItem({required this.name, required this.price, required this.imagePath});
}
