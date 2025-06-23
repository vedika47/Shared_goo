import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:location/location.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:shared_go_app/login_page.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  LocationData? _currentLocation;
  LatLng? _destination;
  final TextEditingController _destinationController = TextEditingController();
  List<LatLng> _routePoints = [];
  double? _distance;
  double? _fare;
  String? _transactionStatus;
  bool _isLoading = false;

  final String apiUrl = "https://3cf9-150-129-156-37.ngrok-free.app";
  final String passengerAddress = "0x0032cC0A8AAA063F974BC99Ba22352f98b66c88B";
  final String passengerPrivateKey = "0xbd56209a961c8ba65c97893672caf206d479af26b7dc03bc73789431d8ab8e60";

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  void _getCurrentLocation() async {
    Location location = Location();
    LocationData locationData = await location.getLocation();
    setState(() {
      _currentLocation = locationData;
    });
  }

  Future<void> _setDestination(String place) async {
    final uri = Uri.parse("https://nominatim.openstreetmap.org/search?q=$place&format=json");
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data.isNotEmpty) {
        setState(() {
          _destination = LatLng(
            double.parse(data[0]['lat']),
            double.parse(data[0]['lon']),
          );
        });
        _findRoute();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Location not found")),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to fetch location")),
      );
    }
  }

  Future<void> _calculateDistanceAndFare() async {
    if (_currentLocation != null && _destination != null) {
      try {
        String url =
            "https://router.project-osrm.org/route/v1/driving/${_currentLocation!.longitude},${_currentLocation!.latitude};${_destination!.longitude},${_destination!.latitude}?overview=full&geometries=geojson";
        final response = await http.get(Uri.parse(url));

        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          _distance = data['routes'][0]['distance'] / 1000;
          // Calculate fare as 0.001 ETH per kilometer
          _fare = _distance! * 0.001;
          
          final List<dynamic> coordinates = data['routes'][0]['geometry']['coordinates'];
          final List<LatLng> routePoints = coordinates
              .map((point) => LatLng(point[1], point[0]))
              .toList();

          setState(() {
            _routePoints = routePoints;
          });
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Failed to calculate route")),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Error calculating distance and fare")),
        );
      }
    }
  }

  void _findRoute() async {
    await _calculateDistanceAndFare();
  }

  Future<void> _requestRide() async {
    if (_currentLocation != null && _destination != null && _fare != null) {
      setState(() {
        _isLoading = true;
        _transactionStatus = 'Processing request...';
      });

      try {
        final response = await http.post(
          Uri.parse('$apiUrl/request_ride'),
          headers: {'Content-Type': 'application/json'},
          body: json.encode({
            'passenger': passengerAddress,
            'passenger_private_key': passengerPrivateKey,
            'fare': _fare.toString(),
            'distance_km': _distance!.round(),
            'start_location': '${_currentLocation!.latitude},${_currentLocation!.longitude}',
            'end_location': '${_destination!.latitude},${_destination!.longitude}',
            'eco_miles_to_use': 0,
          }),
        );

        if (response.statusCode == 200) {
          final data = json.decode(response.body);
          setState(() {
            _transactionStatus = 'Ride requested: ${data['txn_hash']}';
          });
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Ride Requested Successfully")),
          );
        } else {
          final error = json.decode(response.body);
          setState(() {
            _transactionStatus = 'Error: ${error['error']}';
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(error['error'])),
          );
        }
      } catch (e) {
        setState(() {
          _transactionStatus = 'Error: $e';
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please select a destination first")),
      );
    }
  }

  void _signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Error signing out")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Dashboard', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () => _signOut(context),
          ),
        ],
      ),
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: _destinationController,
                    decoration: InputDecoration(
                      hintText: 'Where to?',
                      hintStyle: const TextStyle(color: Colors.grey),
                      prefixIcon: const Icon(Icons.location_on, color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onSubmitted: (value) {
                      _setDestination(value);
                    },
                  ),
                ),
                if (_distance != null && _fare != null)
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Distance: ${_distance!.toStringAsFixed(2)} km',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Fare: ${_fare!.toStringAsFixed(3)} ETH',
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _requestRide,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(_isLoading ? Icons.hourglass_empty : Icons.directions_car),
                        const SizedBox(width: 8),
                        Text(
                          _isLoading ? "Processing..." : "Request Ride",
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: _currentLocation == null
                      ? const Center(child: CircularProgressIndicator())
                      : FlutterMap(
                          options: MapOptions(
                            initialCenter: LatLng(_currentLocation!.latitude!, _currentLocation!.longitude!),
                            initialZoom: 14.0,
                          ),
                          children: [
                            TileLayer(
                              urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                              userAgentPackageName: 'com.example.app',
                            ),
                            MarkerLayer(
                              markers: [
                                Marker(
                                  point: LatLng(_currentLocation!.latitude!, _currentLocation!.longitude!),
                                  width: 40,
                                  height: 40,
                                  child: const Icon(Icons.location_on, color: Colors.red, size: 40),
                                ),
                                if (_destination != null)
                                  Marker(
                                    point: _destination!,
                                    width: 40,
                                    height: 40,
                                    child: const Icon(Icons.flag, color: Colors.blue, size: 40),
                                  ),
                              ],
                            ),
                            if (_routePoints.isNotEmpty)
                              PolylineLayer(
                                polylines: [
                                  Polyline(
                                    points: _routePoints,
                                    strokeWidth: 4.0,
                                    color: Colors.blue,
                                  ),
                                ],
                              ),
                          ],
                        ),
                ),
              ],
            ),
          ),
          if (_isLoading)
            Container(
              color: Colors.black.withOpacity(0.3),
              child: const Center(child: CircularProgressIndicator()),
            ),
        ],
      ),
      bottomSheet: _transactionStatus != null
          ? Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              color: Colors.grey[200],
              child: Text(_transactionStatus!),
            )
          : null,
    );
  } 

  @override
  void dispose() {
    _destinationController.dispose();
    super.dispose();
  }
}