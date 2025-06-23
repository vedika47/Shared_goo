// driver_page.dart
import 'package:flutter/material.dart';
import 'package:shared_go_app/ride_requests_page.dart';

class DriverPage extends StatelessWidget {
  const DriverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Driver Page')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RideRequestsPage()),
            );
          },
          child: const Text('View Ride Requests'),
        ),
      ),
    );
  }
}