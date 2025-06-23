  // import 'package:flutter/material.dart';
  // import 'package:firebase_auth/firebase_auth.dart';
  // import 'package:google_fonts/google_fonts.dart';
  // import 'package:shared_go_app/signup_page.dart';
  // import 'package:shared_go_app/user_page.dart';

  // class LoginPage extends StatefulWidget {
  //   const LoginPage({super.key});

  //   @override
  //   _LoginPageState createState() => _LoginPageState();
  // }

  // class _LoginPageState extends State<LoginPage> {
  //   final TextEditingController _emailController = TextEditingController();
  //   final TextEditingController _passwordController = TextEditingController();
  //   final FirebaseAuth _auth = FirebaseAuth.instance;

  //   void _signIn() async {
  //     try {
  //       await _auth.signInWithEmailAndPassword(
  //         email: _emailController.text.trim(),
  //         password: _passwordController.text.trim(),
  //       );
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text('Login Successful!')),
  //       );
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(builder: (context) => const UserPage()),
  //       );
  //     } catch (e) {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text(e.toString())),
  //       );
  //     }
  //   }

  //   @override
  //   Widget build(BuildContext context) {
  //     return Scaffold(
  //       body: Padding(
  //         padding: const EdgeInsets.all(16.0),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             Image.asset('assets/assetslogin.png', width: 200, height: 200),
  //             const SizedBox(height: 20),
  //             Text(
  //               'Welcome!',
  //               style: GoogleFonts.poppins(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.red[900]),
  //             ),
  //             const SizedBox(height: 20),
  //             TextField(
  //               controller: _emailController,
  //               decoration: InputDecoration(
  //                 prefixIcon: Icon(Icons.email, color: Colors.grey),
  //                 labelText: 'Email',
  //                 border: OutlineInputBorder(),
  //               ),
  //             ),
  //             const SizedBox(height: 10),
  //             TextField(
  //               controller: _passwordController,
  //               obscureText: true,
  //               decoration: InputDecoration(
  //                 prefixIcon: Icon(Icons.lock, color: Colors.grey),
  //                 labelText: 'Password',
  //                 border: OutlineInputBorder(),
  //               ),
  //             ),
  //             const SizedBox(height: 10),
  //             ElevatedButton(
  //               onPressed: _signIn,
  //               style: ElevatedButton.styleFrom(
  //                 backgroundColor: Colors.red[900],
  //                 padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
  //               ),
  //               child: Text('Sign In', style: GoogleFonts.poppins(fontSize: 16, color: Colors.white)),
  //             ),
  //             TextButton(
  //               onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignUpPage())),
  //               child: Text("Don't have an account? Sign Up", style: GoogleFonts.poppins(color: Colors.blue)),
  //             ),
  //           ],
  //         ),
  //       ),
  //     );
  //   }
  // }



  // // login_page.dart
  // import 'package:flutter/material.dart';
  // import 'package:google_fonts/google_fonts.dart';
  // import 'package:shared_go_app/signup_page.dart';
  // import 'package:shared_go_app/user_page.dart';

  // class LoginPage extends StatelessWidget {
  //   const LoginPage({super.key});

  //   @override
  //   Widget build(BuildContext context) {
  //     return Scaffold(
  //       body: Padding(
  //         padding: const EdgeInsets.all(16.0),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             // Illustration (PNG image replacing drawn objects)
  //             Image.asset(
  //               'assets/assetslogin.png', // Replace with your PNG file name
  //               width: 200,
  //               height: 200,
  //               fit: BoxFit.contain, // Adjust fit as needed (e.g., BoxFit.cover, BoxFit.fill)
  //             ),
  //             SizedBox(height: 20),
  //             // Welcome title
  //             Text(
  //               'Welcome!',
  //               style: GoogleFonts.poppins(
  //                 fontSize: 32,
  //                 fontWeight: FontWeight.bold,
  //                 color: Colors.red[900],
  //               ),
  //             ),
  //             SizedBox(height: 20),
  //             // Email or Username field
  //             TextField(
  //               decoration: InputDecoration(
  //                 prefixIcon: Icon(Icons.email, color: Colors.grey),
  //                 labelText: 'Email or Username',
  //                 border: OutlineInputBorder(),
  //                 focusedBorder: OutlineInputBorder(
  //                   borderSide: BorderSide(color: Colors.blue),
  //                 ),
  //               ),
  //             ),
  //             SizedBox(height: 10),
  //             // Password field
  //             TextField(
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
  //             // Forgot Password link
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
  //             // Sign In button
  //             ElevatedButton(
  //               onPressed: () {
  //                 Navigator.push(
  //                   context,
  //                   MaterialPageRoute(builder: (context) => const UserPage()),
  //                 );
  //               },
  //               style: ElevatedButton.styleFrom(
  //                 backgroundColor: Colors.red[900],
  //                 padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
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
  //             SizedBox(height: 10),
  //             // Sign Up link
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
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_go_app/signup_page.dart';
import 'package:shared_go_app/user_page.dart';
import 'driver_login_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _signIn() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login Successful!')),
      );
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const UserPage()),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Black background
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/login.png', width: 200, height: 200),
            const SizedBox(height: 20),
            Text(
              'Welcome!',
              style: GoogleFonts.poppins(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.blue[400],
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _emailController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email, color: Colors.white70),
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.white70),
                border: OutlineInputBorder(),
                fillColor: Colors.grey[900],
                filled: true,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _passwordController,
              obscureText: true,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock, color: Colors.white70),
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.white70),
                border: OutlineInputBorder(),
                fillColor: Colors.grey[900],
                filled: true,
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
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
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
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
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const SignUpPage()),
              ),
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
    );
  }
}
