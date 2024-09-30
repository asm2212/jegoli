import 'package:flutter/material.dart';
import 'package:jegoli/common/color_extension.dart';
import 'package:jegoli/screens/welcome/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _showApp();
  }

  void _showApp() async {
    await Future.delayed(const Duration(seconds: 3));
    Navigator.pushReplacement(
      context, 
      MaterialPageRoute(builder: (context) => const WelcomeScreen())
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            child: Image.asset(
              "assets/images/welcome-top-splash.jpg",
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height * 0.3,
            child: Image.asset(
              "assets/images/jegol-logo.jpg",
              fit: BoxFit.contain,
              height: MediaQuery.of(context).size.width * 0.38,  
              width: MediaQuery.of(context).size.width * 0.38,
            ),
          ),
          Positioned(
            bottom: 280,
            child: RichText(
              textAlign: TextAlign.center, 
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "JEGOL\n", 
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: ColorExtension.primary,
                    ),
                  ),
                  TextSpan(
                    text: "food delivery",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: ColorExtension.secondaryText,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
