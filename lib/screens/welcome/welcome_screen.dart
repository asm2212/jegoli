import 'package:flutter/material.dart';
import 'package:jegoli/co_widget/round_button.dart';
import 'package:jegoli/common/color_extension.dart';
import 'package:jegoli/screens/auth/login_screen.dart';
import 'package:jegoli/screens/auth/signup_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.45,
              child: Stack(
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
                    top: MediaQuery.of(context).size.height * 0.1,
                    child: Image.asset(
                      "assets/images/jegol-logo.jpg",
                      fit: BoxFit.contain,
                      height: MediaQuery.of(context).size.width * 0.38,
                      width: MediaQuery.of(context).size.width * 0.38,
                    ),
                  ),
                  Positioned(
                    bottom: 20,
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
                            text: "FOOD DELIVERY",
                            style: TextStyle(
                              fontSize: 12,
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
            ),
            SizedBox(height: MediaQuery.of(context).size.width * 0.1),
            Text(
              "Discover the best foods from over 100\n restaurants and fast delivery to your \n door step",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13,
                color: ColorExtension.secondaryText,
                fontWeight: FontWeight.w500
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.width * 0.1),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: RoundButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen())
                  );
                }, 
                title: "Login"),
            ),
            SizedBox(height: MediaQuery.of(context).size.width * 0.1),
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: RoundButton(
                onPressed: () {
                     Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignupScreen())
                  );
                }, 
                type: RoundButtonType.textPrimary,
                title: "Create an Account"),
            ),
          ],
        ),
      ),
    );
  }
}
