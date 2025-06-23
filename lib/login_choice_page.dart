// // lib/login_choice_page.dart
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// // Assume these are the pages for driver and user login (create these files in lib/)
import 'driver_login_page.dart'; // You’ve already created this
// import 'user_login_page.dart';   // You’ve already created this
// import 'signup_page.dart';       // Your existing signup page

// class LoginChoicePage extends StatelessWidget {
//   const LoginChoicePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // Get screen width and height for responsive design
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;

//     return Scaffold(
//       body: SafeArea( // Ensures content stays within safe areas (e.g., notches, status bars)
//         child: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//               colors: [
//                 Colors.lightBlue[100]!, // Non-const expression, works fine in runtime
//                 Colors.white,
//               ],
//             ),
//           ),
//           child: Padding(
//             padding: EdgeInsets.all(screenWidth * 0.05), // Responsive padding (5% of screen width)
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 // App Title or Logo (Replace with your image if needed)
//                 Text(
//                   'Choose Account Type',
//                   style: GoogleFonts.poppins(
//                     fontSize: screenWidth * 0.06, // Responsive font size (6% of screen width)
//                     fontWeight: FontWeight.bold,
//                     color: Colors.blue[900],
//                   ),
//                 ),
//                 SizedBox(height: screenHeight * 0.02), // Responsive spacing (2% of screen height)
//                 // Row for Driver and User selection
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     // Driver Button
//                     Flexible( // Makes the button flexible and responsive
//                       child: ElevatedButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => const DriverLoginPage()),
//                           );
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue, // Blue for Driver, matching the image
//                           padding: EdgeInsets.symmetric(
//                             vertical: screenHeight * 0.03, // Responsive vertical padding (3% of screen height)
//                             horizontal: screenWidth * 0.05, // Responsive horizontal padding (5% of screen width)
//                           ),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(screenWidth * 0.02), // Responsive radius (2% of screen width)
//                           ),
//                         ),
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min, // Ensures the column takes minimum space
//                           children: [
//                             Image.asset(
//                               'assets/driver_icon.png', // Replace with your driver icon PNG in assets/
//                               width: screenWidth * 0.12, // Responsive icon size (12% of screen width)
//                               height: screenWidth * 0.12, // Responsive icon size (12% of screen width)
//                             ),
//                             SizedBox(height: screenHeight * 0.01), // Responsive spacing (1% of screen height)
//                             Text(
//                               'Driver',
//                               style: GoogleFonts.poppins(
//                                 fontSize: screenWidth * 0.04, // Responsive font size (4% of screen width)
//                                 color: Colors.white,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: screenWidth * 0.02), // Responsive spacing between buttons (2% of screen width)
//                     // User Button
//                     Flexible( // Makes the button flexible and responsive
//                       child: ElevatedButton(
//                         onPressed: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(builder: (context) => const UserLoginPage()),
//                           );
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.grey[300], // Grey for User, matching the image
//                           padding: EdgeInsets.symmetric(
//                             vertical: screenHeight * 0.03, // Responsive vertical padding (3% of screen height)
//                             horizontal: screenWidth * 0.05, // Responsive horizontal padding (5% of screen width)
//                           ),
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(screenWidth * 0.02), // Responsive radius (2% of screen width)
//                           ),
//                         ),
//                         child: Column(
//                           mainAxisSize: MainAxisSize.min, // Ensures the column takes minimum space
//                           children: [
//                             Image.asset(
//                               'assets/user_icon.png', // Replace with your user icon PNG in assets/
//                               width: screenWidth * 0.12, // Responsive icon size (12% of screen width)
//                               height: screenWidth * 0.12, // Responsive icon size (12% of screen width)
//                             ),
//                             SizedBox(height: screenHeight * 0.01), // Responsive spacing (1% of screen height)
//                             Text(
//                               'User',
//                               style: GoogleFonts.poppins(
//                                 fontSize: screenWidth * 0.04, // Responsive font size (4% of screen width)
//                                 color: Colors.black,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: screenHeight * 0.04), // Responsive spacing (4% of screen height)
//                 // Sign Up link
//                 TextButton(
//                   onPressed: () {
//                     // Navigate to signup page (your existing signup_page.dart, non-const)
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => SignUpPage()), // Removed 'const' here
//                     );
//                   },
//                   child: Text(
//                     'No account? Sign up',
//                     style: GoogleFonts.poppins(
//                       fontSize: screenWidth * 0.035, // Responsive font size (3.5% of screen width)
//                       color: Colors.blue,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// Assume these are the pages for driver and user login (create these files in lib/)
import 'driver_login_page.dart'; // You’ve already created this
import 'user_login_page.dart';   // You’ve already created this
import 'signup_page.dart';       // Your existing signup page

class LoginChoicePage extends StatelessWidget {
  const LoginChoicePage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.black, // Set background to black
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // App Title or Logo
                Text(
                  'Choose Account Type',
                  style: GoogleFonts.poppins(
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.bold,
                    color: Colors.white, // White text for contrast on black background
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
                
                // Row for Driver and User selection
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Driver Button
                    Flexible(
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.blue[400]!, Colors.blue[900]!], // Blue gradient for the button
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(screenWidth * 0.02),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.withOpacity(0.3),
                              spreadRadius: 3,
                              blurRadius: 8,
                            ),
                          ],
                        ),
                        child: TextButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const DriverLoginPage()),
                            );
                          },
                          icon: Icon(
                            Icons.directions_car,
                            color: Colors.white,
                            size: screenWidth * 0.06,
                          ),
                          label: Text(
                            'Driver',
                            style: GoogleFonts.poppins(
                              fontSize: screenWidth * 0.045,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              vertical: screenHeight * 0.02,
                              horizontal: screenWidth * 0.08,
                            ),
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: screenWidth * 0.05),
                    
                    // User Button
                    Flexible(
                      child: AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Colors.blue[400]!, Colors.blue[900]!], // Blue gradient for the button
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(screenWidth * 0.02),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.withOpacity(0.3),
                              spreadRadius: 3,
                              blurRadius: 8,
                            ),
                          ],
                        ),
                        child: TextButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const UserLoginPage()),
                            );
                          },
                          icon: Icon(
                            Icons.person,
                            color: Colors.white,
                            size: screenWidth * 0.06,
                          ),
                          label: Text(
                            'User',
                            style: GoogleFonts.poppins(
                              fontSize: screenWidth * 0.045,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                              vertical: screenHeight * 0.02,
                              horizontal: screenWidth * 0.08,
                            ),
                            backgroundColor: Colors.transparent,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                
                SizedBox(height: screenHeight * 0.04),
                
                // Sign Up link with more attractive styling
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                    );
                  },
                  child: Text(
                    'No account? Sign up',
                    style: GoogleFonts.poppins(
                      fontSize: screenWidth * 0.035,
                      color: Colors.blue[300], // Lighter blue for the link
                      fontWeight: FontWeight.w500,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
