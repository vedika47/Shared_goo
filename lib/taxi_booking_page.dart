// taxi_booking_page.dart
import 'package:flutter/material.dart';

class TaxiBookingPage extends StatelessWidget {
  const TaxiBookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow[700],
        title: const Text('Book a Taxi'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/taxi_image.png', // Replace with your taxi image asset
              height: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            const Text(
              'Ready to Book Your Taxi?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Add your booking logic here
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Taxi Booked!')),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow[700],
                foregroundColor: Colors.black,
              ),
              child: const Text('Book Taxi'),
            ),
          ],
        ),
      ),
    );
  }
}