

// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class DriverDashboardPage extends StatefulWidget {
//   const DriverDashboardPage({super.key});

//   @override
//   _DriverDashboardPageState createState() => _DriverDashboardPageState();
// }

// class _DriverDashboardPageState extends State<DriverDashboardPage> {
//   final DatabaseReference _dbRef = FirebaseDatabase.instanceFor(
//     app: Firebase.app(),
//     databaseURL: "https://sharedjourney-3ff2a-default-rtdb.firebaseio.com/",
//   ).ref("ride_requests");

//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final String apiUrl = "https://3cf9-150-129-156-37.ngrok-free.app"; // Replace with your API URL
//   final String driverAddress = "0x2E8618b65B499d89ed7EAc948802B0996bF3d36a";
//   final String driverPrivateKey = "0x48e4385816ce26712906728eaa1b176cb74862516503fdb0a52b84993bfc98b0"; // Replace with actual private key

//   List<Map<String, dynamic>> _rideRequests = [];

//   @override
//   void initState() {
//     super.initState();
//     _fetchRideRequests();
//   }

//   void _fetchRideRequests() {
//     _dbRef.onValue.listen((event) {
//       final data = event.snapshot.value as Map<dynamic, dynamic>?;
//       if (data != null) {
//         setState(() {
//           _rideRequests = data.entries.map((entry) {
//             final request = entry.value as Map<dynamic, dynamic>;
//             return {
//               "id": entry.key,
//               "user": request["user"] ?? "Unknown",
//               "current_location": request["current_location"] ?? "Unknown",
//               "destination": request["destination"] ?? "Unknown",
//               "status": request["status"] ?? "pending",
//             };
//           }).toList();
//         });
//       } else {
//         setState(() {
//           _rideRequests = [];
//         });
//       }
//     });
//   }

//   Future<void> _acceptRide(String requestId) async {
//     try {
//       final response = await http.post(
//         Uri.parse('$apiUrl/accept_ride'),
//         headers: {'Content-Type': 'application/json'},
//         body: json.encode({
//           'driver': driverAddress,
//           'driver_private_key': driverPrivateKey,
//           'ride_id': requestId,
//         }),
//       );

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Ride accepted: ${data['txn_hash']}")),
//         );
        
//         // Update ride status in Firebase
//         await _dbRef.child(requestId).update({"status": "accepted"});
//         setState(() {
//           _rideRequests.firstWhere((ride) => ride['id'] == requestId)["status"] = "accepted";
//         });

//         // Automatically complete the ride
//         await _completeRide(requestId);
//       } else {
//         final error = json.decode(response.body);
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Error accepting ride: ${error['error']}")),
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Error: $e")),
//       );
//     }
//   }

//   Future<void> _completeRide(String requestId) async {
//     try {
//       final response = await http.post(
//         Uri.parse('$apiUrl/complete_ride'),
//         headers: {'Content-Type': 'application/json'},
//         body: json.encode({
//           'driver': driverAddress,
//           'driver_private_key': driverPrivateKey,
//           'ride_id': requestId,
//         }),
//       );

//       if (response.statusCode == 200) {
//         final data = json.decode(response.body);
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Ride completed: ${data['txn_hash']}")),
//         );
        
//         // Update ride status in Firebase
//         await _dbRef.child(requestId).update({"status": "completed"});
//         setState(() {
//           _rideRequests.removeWhere((ride) => ride['id'] == requestId);
//         });
//       } else {
//         final error = json.decode(response.body);
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Error completing ride: ${error['error']}")),
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text("Error: $e")),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Driver Dashboard"),
//         backgroundColor: Colors.blue[900],
//       ),
//       body: _rideRequests.isEmpty
//           ? const Center(
//               child: Text(
//                 "No ride requests available.",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//             )
//           : ListView.builder(
//               itemCount: _rideRequests.length,
//               itemBuilder: (context, index) {
//                 final ride = _rideRequests[index];
//                 return Card(
//                   margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                   elevation: 3,
//                   child: ListTile(
//                     leading: const Icon(Icons.person, color: Colors.blue),
//                     title: Text("User: ${ride["user"]}"),
//                     subtitle: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text("From: ${ride["current_location"]}"),
//                         Text("To: ${ride["destination"]}"),
//                         Text(
//                           "Status: ${ride["status"]}",
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: ride["status"] == "accepted" ? Colors.green : Colors.red,
//                           ),
//                         ),
//                       ],
//                     ),
//                     trailing: ride["status"] == "pending"
//                         ? ElevatedButton(
//                             onPressed: () => _acceptRide(ride["id"]),
//                             style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
//                             child: const Text("Accept"),
//                           )
//                         : const Icon(Icons.check_circle, color: Colors.green),
//                   ),
//                 );
//               },
//             ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'dart:convert';

class DriverDashboardPage extends StatefulWidget {
  const DriverDashboardPage({super.key});

  @override
  _DriverDashboardPageState createState() => _DriverDashboardPageState();
}

class _DriverDashboardPageState extends State<DriverDashboardPage> {
  List<Map<String, dynamic>> _rideRequests = [
    {
      "id": "1",
      "user": "Aniket Vyavhare",
      "current_location": "akurdi",
      "destination": "pimpri",
      "status": "pending",
    },
    {
      "id": "2",
      "user": "Kundan Jangale",
      "current_location": "akurdi",
      "destination": "kondhwa",
      "status": "pending",
    },
  ];

  void _acceptRide(String requestId) {
    setState(() {
      _rideRequests.firstWhere((ride) => ride['id'] == requestId)['status'] = "accepted";
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Ride $requestId accepted")),
    );
  }

  void _completeRide(String requestId) {
    setState(() {
      _rideRequests.removeWhere((ride) => ride['id'] == requestId);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Ride $requestId completed")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Driver Dashboard"),
        backgroundColor: Colors.blue[900],
      ),
      body: _rideRequests.isEmpty
          ? const Center(
              child: Text(
                "No ride requests available.",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
          : ListView.builder(
              itemCount: _rideRequests.length,
              itemBuilder: (context, index) {
                final ride = _rideRequests[index];

                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  elevation: 3,
                  child: ListTile(
                    leading: const Icon(Icons.person, color: Colors.blue),
                    title: Text("User: ${ride["user"]}"),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("From: ${ride["current_location"]}"),
                        Text("To: ${ride["destination"]}"),
                        Text(
                          "Status: ${ride["status"]}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: ride["status"] == "accepted" ? Colors.green : Colors.red,
                          ),
                        ),
                      ],
                    ),
                    trailing: ride["status"] == "pending"
                        ? ElevatedButton(
                            onPressed: () => _acceptRide(ride["id"]),
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                            child: const Text("Accept"),
                          )
                        : ElevatedButton(
                            onPressed: () => _completeRide(ride["id"]),
                            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                            child: const Text("Complete Trip"),
                          ),
                  ),
                );
              },
            ),
    );
  }
}
