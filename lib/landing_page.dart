// // landing_page.dart
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:lottie/lottie.dart';
// // import 'package:shared_go_app/login_page.dart';
// import 'package:shared_go_app/login_choice_page.dart';

// class LandingPage extends StatelessWidget {
//   const LandingPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               // Lottie Animation from Local File
//               Lottie.asset(
//                 'assets/animation.json', // Ensure this file exists in the assets folder
//                 width: 250,
//                 height: 250,
//               ),

//               const SizedBox(height: 20),

//               // App Name
//               Text(
//                 'SharedGo',
//                 style: GoogleFonts.poppins(
//                   fontSize: 36,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.blueAccent,
//                 ),
//               ),

//               const SizedBox(height: 10),

//               // Tagline
//               Text(
//                 'Seamless Sharing, Smarter Moving',
//                 textAlign: TextAlign.center,
//                 style: GoogleFonts.poppins(fontSize: 20, color: Colors.black54),
//               ),

//               const SizedBox(height: 30),

//               // Get Started Button
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     // MaterialPageRoute(builder: (context) => const LoginPage()),
//                   MaterialPageRoute(builder: (context) => const LoginChoicePage()),
                  
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blueAccent,
//                   padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                 ),
//                 child: const Text(
//                   'Get Started',
//                   style: TextStyle(fontSize: 20, color: Colors.white),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// landing_page.dart
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_go_app/login_choice_page.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _circleAnimation;
  late Animation<double> _carAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 5), // Changed from 2 to 7 seconds
    );

    _circleAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _carAnimation = Tween<double>(begin: 300, end: 50).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _controller.forward(); // Start the animation immediately
    
    // Add navigation after animation completes
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const LoginChoicePage()),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Stack(
            children: [
              // Circular animation filling the screen, moved slightly higher
              CustomPaint(
                painter: CirclePainter(_circleAnimation.value),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                ),
              ),
              // Car image animating toward the user
              Positioned(
                left: _carAnimation.value, // Moves horizontally from right to left
                top: MediaQuery.of(context).size.height / 3 - 130, // Center vertically, adjust as needed
                child: Image.asset(
                  'assets/land.png', 
                  width: 350,
                  height: 300,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    // Display an error placeholder if the image fails to load
                    return Container(
                      color: Colors.red,
                      width: 350,
                      height: 300,
                      child: const Center(child: Text('Image Failed to Load')),
                    );
                  },
                ),
              ),
              // App content (appears after animation)
              Positioned(
                bottom: 150,
                left: 0,
                right: 0,
                child: Opacity(
                  opacity: _controller.value, // Fade in content as animation progresses
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'SharedGo',
                        style: GoogleFonts.poppins(
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Seamless Sharing, Smarter Moving',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.blue[200],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  final double progress;

  CirclePainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blueAccent.withOpacity(0.5)
      ..style = PaintingStyle.fill;

    final center = Offset(size.width / 2, size.height / 2 - 100); // Moved up by 100 pixels
    final radius = size.shortestSide * progress / 2;

    canvas.drawCircle(center, radius, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}