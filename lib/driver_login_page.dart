// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'user_page.dart';
// import 'signup_page.dart';
// import 'DriverDashboardPage.dart';

// class DriverLoginPage extends StatefulWidget {
//   const DriverLoginPage({super.key});

//   @override
//   _DriverLoginPageState createState() => _DriverLoginPageState();
// }

// class _DriverLoginPageState extends State<DriverLoginPage> {
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   Future<void> _signIn() async {
//     try {
//       await _auth.signInWithEmailAndPassword(
//         email: _emailController.text.trim(),
//         password: _passwordController.text.trim(),
//       );
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const DriverDashboardPage()),
//       );
//     } on FirebaseAuthException catch (e) {
//       String errorMessage = "An error occurred. Please try again.";
//       if (e.code == 'user-not-found') {
//         errorMessage = "No user found for this email.";
//       } else if (e.code == 'wrong-password') {
//         errorMessage = "Incorrect password. Please try again.";
//       }
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(errorMessage)),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.grey[200],
//         title: const Text(
//           '3:21 PM',
//           style: TextStyle(fontSize: 12, color: Colors.grey),
//         ),
//         actions: const [
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
//             const SizedBox(height: 20),
//             Text(
//               'Welcome, Driver!',
//               style: GoogleFonts.poppins(
//                 fontSize: 32,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.blue[900],
//               ),
//             ),
//             const SizedBox(height: 20),
//             TextField(
//               controller: _emailController,
//               decoration: InputDecoration(
//                 prefixIcon: const Icon(Icons.email, color: Colors.grey),
//                 labelText: 'Email',
//                 border: const OutlineInputBorder(),
//                 focusedBorder: const OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.blue),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10),
//             TextField(
//               controller: _passwordController,
//               obscureText: true,
//               decoration: InputDecoration(
//                 prefixIcon: const Icon(Icons.lock, color: Colors.grey),
//                 labelText: 'Password',
//                 border: const OutlineInputBorder(),
//                 focusedBorder: const OutlineInputBorder(
//                   borderSide: BorderSide(color: Colors.blue),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10),
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
//             const SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: _signIn,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue[900],
//                 padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//               ),
//               child: Text(
//                 'Sign In',
//                 style: GoogleFonts.poppins(
//                   fontSize: 16,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 10),
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
import 'signup_page.dart';
import 'DriverDashboardPage.dart';

class DriverLoginPage extends StatefulWidget {
  const DriverLoginPage({super.key});

  @override
  State<DriverLoginPage> createState() => _DriverLoginPageState();
}

class _DriverLoginPageState extends State<DriverLoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _signIn() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const DriverDashboardPage()),
      );
    } on FirebaseAuthException catch (e) {
      String errorMessage = "An error occurred. Please try again.";
      if (e.code == 'user-not-found') {
        errorMessage = "No user found for this email.";
      } else if (e.code == 'wrong-password') {
        errorMessage = "Incorrect password. Please try again.";
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 100),
                Image.asset(
                  'assets/loginmainn.png',
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
                Text(
                  'Welcome, Driver!',
                  style: GoogleFonts.poppins(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[400],
                  ),
                ),
                const SizedBox(height: 20),
                _buildTextFieldContainer(
                  controller: _emailController,
                  prefixIcon: Icons.email,
                  labelText: 'Email',
                ),
                const SizedBox(height: 10),
                _buildTextFieldContainer(
                  controller: _passwordController,
                  prefixIcon: Icons.lock,
                  labelText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 10),
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
                ElevatedButton(
                  onPressed: _signIn,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[400],
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    'Sign In',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
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
    return TextField(
      controller: controller,
      obscureText: obscureText,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon, color: Colors.white70),
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.white70),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.white70),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.blue[300]!),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }
}


