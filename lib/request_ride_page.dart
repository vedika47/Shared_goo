// request_ride_page.dart
import 'package:flutter/material.dart';

class RequestRidePage extends StatelessWidget {
  const RequestRidePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Request a Ride')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Enter your destination'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Submit Request'),
            ),
          ],
        ),
      ),
    );
  }
}