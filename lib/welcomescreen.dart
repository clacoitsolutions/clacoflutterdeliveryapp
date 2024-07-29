import 'package:flutter/material.dart';
import 'dart:async'; // Import for Timer

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    // Start a timer to navigate after 5 seconds
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/login'); // Replace the current route
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(),
        backgroundColor: Colors.pink,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.pink, Colors.white],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                ),
                clipBehavior: Clip.hardEdge, // This will clip the image with rounded corners
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 150, // Set the height of the image if needed
                ),
              ),
              SizedBox(height: 20), // Space between image and progress bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 110.0),
                child: Column(
                  children: [
                    TweenAnimationBuilder(
                      tween: Tween<double>(begin: 0, end: 1),
                      duration: const Duration(seconds: 5),
                      builder: (context, value, child) {
                        return Stack(
                          children: [
                            Container(
                              height: 14.5, // Height of the progress bar
                              decoration: BoxDecoration(
                                color: Colors.grey[200],
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                            Positioned(
                              left: MediaQuery.of(context).size.width * 0.8 * value, // Animate the left property
                              child: Container(
                                height: 15, // Match the height of the background container
                                width: MediaQuery.of(context).size.width * 0.2 , // Progress value
                                decoration: const BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(height: 10), // Space between progress bar and text
                    Text(
                      'Delivery App',
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}