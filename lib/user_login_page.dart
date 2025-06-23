// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'login_page.dart';
// import 'signup_page.dart';
// import 'user_page.dart';

// class UserLoginPage extends StatefulWidget {
//   const UserLoginPage({super.key});

//   @override
//   _UserLoginPageState createState() => _UserLoginPageState();
// }

// class _UserLoginPageState extends State<UserLoginPage> {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   bool isLoading = false;
//   String errorMessage = '';

//   Future<void> handleLogin() async {
//     setState(() {
//       isLoading = true;
//       errorMessage = '';
//     });

//     try {
//       await _auth.signInWithEmailAndPassword(
//         email: emailController.text.trim(),
//         password: passwordController.text.trim(),
//       );

//       // Navigate to User Page after successful login
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const UserPage()),
//       );
//     } on FirebaseAuthException catch (e) {
//       setState(() {
//         errorMessage = e.message ?? "Login failed. Please try again.";
//       });
//     } finally {
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.grey[200],
//         title: Text(
//           '3:21 PM',
//           style: TextStyle(fontSize: 12, color: Colors.grey),
//         ),
//         actions: [
//           Icon(Icons.signal_cellular_alt, size: 14, color: Colors.grey),
//           SizedBox(width: 5),
//           Icon(Icons.wifi, size: 14, color: Colors.grey),
//           SizedBox(width: 5),
//           Icon(Icons.battery_full, size: 14, color: Colors.grey),
//           SizedBox(width: 5),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Image.asset(
//               'assets/assetslogin.png',
//               width: 200,
//               height: 200,
//               fit: BoxFit.contain,
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Welcome!',
//               style: GoogleFonts.poppins(
//                 fontSize: 32,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.red[900],
//               ),
//             ),
//             SizedBox(height: 20),
//             TextField(
//               controller: emailController,
//               decoration: InputDecoration(
//                 prefixIcon: Icon(Icons.email, color: Colors.grey),
//                 labelText: 'Email',
//                 border: OutlineInputBorder(),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.blue),
//                 ),
//               ),
//             ),
//             SizedBox(height: 10),
//             TextField(
//               controller: passwordController,
//               obscureText: true,
//               decoration: InputDecoration(
//                 prefixIcon: Icon(Icons.lock, color: Colors.grey),
//                 labelText: 'Password',
//                 border: OutlineInputBorder(),
//                 focusedBorder: OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.blue),
//                 ),
//               ),
//             ),
//             SizedBox(height: 10),
//             if (errorMessage.isNotEmpty)
//               Text(
//                 errorMessage,
//                 style: TextStyle(color: Colors.red, fontSize: 12),
//               ),
//             Align(
//               alignment: Alignment.centerRight,
//               child: Text(
//                 'Forgot Password?',
//                 style: GoogleFonts.poppins(
//                   color: Colors.grey,
//                   fontSize: 12,
//                 ),
//               ),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: isLoading ? null : handleLogin,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.red[900],
//                 padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//               ),
//               child: isLoading
//                   ? CircularProgressIndicator(color: Colors.white)
//                   : Text(
//                       'Sign In',
//                       style: GoogleFonts.poppins(
//                         fontSize: 16,
//                         color: Colors.white,
//                       ),
//                     ),
//             ),
//             SizedBox(height: 10),
//             TextButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => const SignUpPage()),
//                 );
//               },
//               child: Text(
//                 "Don't have an account? Sign Up",
//                 style: GoogleFonts.poppins(
//                   color: Colors.blue,
//                   fontSize: 14,
//                 ),
//               ),
//             ),
//           ],    
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'login_page.dart';
import 'signup_page.dart';
import 'user_page.dart';

class UserLoginPage extends StatefulWidget {
  const UserLoginPage({super.key});

  @override
  _UserLoginPageState createState() => _UserLoginPageState();
}

class _UserLoginPageState extends State<UserLoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  bool isLoading = false;
  String errorMessage = '';

  Future<void> handleLogin() async {
    setState(() {
      isLoading = true;
      errorMessage = '';
    });

    try {
      await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      // Navigate to User Page after successful login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const UserPage()),
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message ?? "Login failed. Please try again.";
      });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Black background for the new UI
      body: SingleChildScrollView( // Keep content scrollable
        child: SafeArea( // Ensure content stays within safe areas
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 100),

                // Illustration (PNG image)
                Image.asset(
                  'assets/loginmainn.png', // Use the same illustration as your login page
                  width: 150,
                  height: 150,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.red,
                      width: 150,
                      height: 150,
                      child: const Center(child: Text('Image Failed to Load')),
                    );
                  },
                ),
                const SizedBox(height: 20),

                // Welcome title
                Text(
                  'Welcome!',
                  style: GoogleFonts.poppins(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[400],
                  ),
                ),
                const SizedBox(height: 20),

                // Email or Username field
                _buildTextFieldContainer(
                  controller: emailController,
                  prefixIcon: Icons.email,
                  labelText: 'Email or Username',
                ),
                const SizedBox(height: 10),

                // Password field
                _buildTextFieldContainer(
                  controller: passwordController,
                  prefixIcon: Icons.lock,
                  labelText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 10),

                // Error message
                if (errorMessage.isNotEmpty)
                  Text(
                    errorMessage,
                    style: const TextStyle(color: Colors.red, fontSize: 12),
                  ),

                // Forgot Password link
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Forgot Password?',
                    style: GoogleFonts.poppins(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Sign In button
                ElevatedButton(
                  onPressed: isLoading ? null : handleLogin,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[400],
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : Text(
                          'Sign In',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                ),
                const SizedBox(height: 10),

                // Sign Up link
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUpPage()),
                    );
                  },
                  child: Text(
                    "Don't have an account? Sign Up",
                    style: GoogleFonts.poppins(
                      color: Colors.blue[300],
                      fontSize: 14,
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

  Widget _buildTextFieldContainer({
    required TextEditingController controller,
    required IconData prefixIcon,
    required String labelText,
    bool obscureText = false,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.white70, // Default light grey outline
          width: 1,
        ),
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          prefixIcon: Icon(prefixIcon, color: Colors.white70),
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.white70),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
    );
  }
}
