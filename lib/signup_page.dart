
// import 'package:firebase_core/firebase_core.dart';
// import 'firebase_options.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_database/firebase_database.dart';
// import 'package:shared_go_app/login_page.dart';
// import 'package:shared_go_app/user_page.dart';

// class SignUpPage extends StatefulWidget {
//   const SignUpPage({super.key});

//   @override
//   _SignUpPageState createState() => _SignUpPageState();
// }

// class _SignUpPageState extends State<SignUpPage> {
//   final TextEditingController fullnameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController walletAddressController = TextEditingController();
//   final TextEditingController privateKeyController = TextEditingController();
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   // final DatabaseReference _dbRef = FirebaseDatabase.instance.ref().child('users');
//   final DatabaseReference _dbRef = FirebaseDatabase.instanceFor(
//     app: Firebase.app(),
//     databaseURL: "https://sharedjourney-3ff2a-default-rtdb.firebaseio.com/",
//   ).ref("users");


//   bool isLoading = false;
//   String errorMessage = '';

//   Future<void> handleSignUp() async {
//     setState(() {
//       isLoading = true;
//       errorMessage = '';
//     });

//     try {
//       UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
//         email: emailController.text.trim(),
//         password: passwordController.text.trim(),
//       );
      
//       String userId = userCredential.user!.uid;
//       await _dbRef.child(userId).set({
//         'fullname': fullnameController.text.trim(),
//         'email': emailController.text.trim(),
//         'walletAddress': walletAddressController.text.trim(),
//         'privateKey': privateKeyController.text.trim(),
//       });

//       // Navigate to User Page after successful signup
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const UserPage()),
//       );
//     } on FirebaseAuthException catch (e) {
//       setState(() {
//         errorMessage = e.message ?? "Signup failed. Please try again.";
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
//       body: Container(
//         color: Colors.white,
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Image.asset(
//                 'assets/assetslogin.png',
//                 width: 200,
//                 height: 200,
//                 fit: BoxFit.contain,
//               ),
//               const SizedBox(height: 20),
//               Text(
//                 'Join Us!',
//                 style: GoogleFonts.poppins(
//                   fontSize: 32,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.red[900],
//                 ),
//               ),
//               const SizedBox(height: 20),
//               TextField(
//                 controller: fullnameController,
//                 decoration: InputDecoration(
//                   prefixIcon: Icon(Icons.person, color: Colors.grey),
//                   labelText: 'Fullname',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               TextField(
//                 controller: emailController,
//                 decoration: InputDecoration(
//                   prefixIcon: Icon(Icons.email, color: Colors.grey),
//                   labelText: 'Email',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               TextField(
//                 controller: passwordController,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   prefixIcon: Icon(Icons.lock, color: Colors.grey),
//                   labelText: 'Password',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               TextField(
//                 controller: walletAddressController,
//                 decoration: InputDecoration(
//                   prefixIcon: Icon(Icons.account_balance_wallet, color: Colors.grey),
//                   labelText: 'Wallet Address',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               TextField(
//                 controller: privateKeyController,
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   prefixIcon: Icon(Icons.vpn_key, color: Colors.grey),
//                   labelText: 'Private Key',
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               if (errorMessage.isNotEmpty)
//                 Text(
//                   errorMessage,
//                   style: TextStyle(color: Colors.red, fontSize: 12),
//                 ),
//               ElevatedButton(
//                 onPressed: isLoading ? null : handleSignUp,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.red[900],
//                   padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                 ),
//                 child: isLoading
//                     ? CircularProgressIndicator(color: Colors.white)
//                     : Text(
//                         'Sign Up',
//                         style: GoogleFonts.poppins(
//                           fontSize: 16,
//                           color: Colors.white,
//                         ),
//                       ),
//               ),
//               const SizedBox(height: 10),
//               TextButton(
//                 onPressed: () {
//                   Navigator.pushReplacement(
//                     context,
//                     MaterialPageRoute(builder: (context) => const LoginPage()),
//                   );
//                 },
//                 child: Text(
//                   "Already have an account? Sign In",
//                   style: GoogleFonts.poppins(
//                     color: Colors.blue,
//                     fontSize: 14,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:shared_go_app/login_page.dart';
import 'package:shared_go_app/user_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> with SingleTickerProviderStateMixin {
  late AnimationController _slideController;
  late Animation<Offset> _imageSlideAnimation;

  // Focus nodes for text fields to detect focus and add outlines
  final FocusNode _fullnameFocusNode = FocusNode();
  final FocusNode _emailFocusNode = FocusNode();
  final FocusNode _passwordFocusNode = FocusNode();
  final FocusNode _walletAddressFocusNode = FocusNode();
  final FocusNode _privateKeyFocusNode = FocusNode();

  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController walletAddressController = TextEditingController();
  final TextEditingController privateKeyController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _dbRef = FirebaseDatabase.instanceFor(
    app: Firebase.app(),
    databaseURL: "https://sharedjourney-3ff2a-default-rtdb.firebaseio.com/",
  ).ref("users");

  bool isLoading = false;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    _slideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500), // Smooth slide animation for the image
    );

    _imageSlideAnimation = Tween<Offset>(
      begin: const Offset(0, -1), // Start off-screen at the top for the image
      end: const Offset(0, 1), // Slide down to the bottom (adjust as needed)
    ).animate(CurvedAnimation(
      parent: _slideController,
      curve: Curves.easeInOut,
    ));

    _slideController.forward(); // Start the slide animation immediately

    // Add listeners to focus nodes for outline animation
    _fullnameFocusNode.addListener(() => setState(() {}));
    _emailFocusNode.addListener(() => setState(() {}));
    _passwordFocusNode.addListener(() => setState(() {}));
    _walletAddressFocusNode.addListener(() => setState(() {}));
    _privateKeyFocusNode.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _slideController.dispose();
    _fullnameFocusNode.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    _walletAddressFocusNode.dispose();
    _privateKeyFocusNode.dispose();
    super.dispose();
  }

  Future<void> handleSignUp() async {
    setState(() {
      isLoading = true;
      errorMessage = '';
    });

    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      
      String userId = userCredential.user!.uid;
      await _dbRef.child(userId).set({
        'fullname': fullnameController.text.trim(),
        'email': emailController.text.trim(),
        'walletAddress': walletAddressController.text.trim(),
        'privateKey': privateKeyController.text.trim(),
      });

      // Navigate to User Page after successful signup
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const UserPage()),
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message ?? "Signup failed. Please try again.";
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
      backgroundColor: Colors.black, // Black background
      body: SingleChildScrollView( // Keep content scrollable to prevent overflow
        child: SafeArea( // Ensure content stays within safe areas
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end, // Align other content at the bottom
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Image with downward slide animation
                AnimatedBuilder(
                  animation: _imageSlideAnimation,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: _imageSlideAnimation.value * MediaQuery.of(context).size.height, // Slide image down to bottom
                      child: Image.asset(
                        'assets/loginmain.png', // Use the same illustration as the login page
                        width: 150, // Reduced from 200 to make it smaller
                        height: 150, // Reduced from 200 to make it smaller
                        fit: BoxFit.contain,
                      ),
                    );
                  },
                ),
                const SizedBox(height: 20),
                // Welcome title
                Text(
                  'Join Us!',
                  style: GoogleFonts.poppins(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[400], // Lighter blue for contrast
                  ),
                ),
                const SizedBox(height: 20),
                // Fullname field with interactive blue outline
                _buildTextFieldContainer(
                  focusNode: _fullnameFocusNode,
                  controller: fullnameController,
                  prefixIcon: Icons.person,
                  labelText: 'Fullname',
                ),
                const SizedBox(height: 10),
                // Email field with interactive blue outline
                _buildTextFieldContainer(
                  focusNode: _emailFocusNode,
                  controller: emailController,
                  prefixIcon: Icons.email,
                  labelText: 'Email',
                ),
                const SizedBox(height: 10),
                // Password field with interactive blue outline
                _buildTextFieldContainer(
                  focusNode: _passwordFocusNode,
                  controller: passwordController,
                  prefixIcon: Icons.lock,
                  labelText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                // Wallet Address field with interactive blue outline
                _buildTextFieldContainer(
                  focusNode: _walletAddressFocusNode,
                  controller: walletAddressController,
                  prefixIcon: Icons.account_balance_wallet,
                  labelText: 'Wallet Address',
                ),
                const SizedBox(height: 10),
                // Private Key field with interactive blue outline
                _buildTextFieldContainer(
                  focusNode: _privateKeyFocusNode,
                  controller: privateKeyController,
                  prefixIcon: Icons.vpn_key,
                  labelText: 'Private Key',
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                // Error message display
                if (errorMessage.isNotEmpty)
                  Text(
                    errorMessage,
                    style: TextStyle(color: Colors.red, fontSize: 12),
                  ),
                const SizedBox(height: 20), // Increased spacing for better layout
                // Sign Up button
                ElevatedButton(
                  onPressed: isLoading ? null : handleSignUp,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[400], // Lighter blue for contrast
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: isLoading
                      ? CircularProgressIndicator(color: Colors.white)
                      : Text(
                          'Sign Up',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.white, // White text on blue button
                          ),
                        ),
                ),
                const SizedBox(height: 10),
                // Sign In link
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginPage()),
                    );
                  },
                  child: Text(
                    "Already have an account? Sign In",
                    style: GoogleFonts.poppins(
                      color: Colors.blue[300], // Lighter blue for visibility
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
    required FocusNode focusNode,
    required TextEditingController controller,
    required IconData prefixIcon,
    required String labelText,
    bool obscureText = false,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200), // Smooth outline animation
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: focusNode.hasFocus
              ? Colors.blue[300]! // Blue outline when focused
              : Colors.white70, // Default light grey outline
          width: focusNode.hasFocus ? 2 : 1, // Thicker outline when focused
        ),
      ),
      child: TextField(
        focusNode: focusNode,
        controller: controller,
        obscureText: obscureText,
        style: const TextStyle(color: Colors.white), // White text for visibility
        decoration: InputDecoration(
          prefixIcon: Icon(prefixIcon, color: Colors.white70), // Lightened icon
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.white70), // Lightened label
          border: InputBorder.none, // Remove default border (handled by container)
          focusedBorder: InputBorder.none, // Remove default focused border
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
    );
  }
}
