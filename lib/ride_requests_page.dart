// ride_requests_page.dart
import 'package:flutter/material.dart';

class RideRequestsPage extends StatelessWidget {
  const RideRequestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ride Requests')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('View ride requests here.'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Accept Ride'),
            ),
          ],
        ),
      ),
    );
  }
}