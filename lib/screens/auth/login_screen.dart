import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:jegoli/co_widget/round_button.dart';
import 'package:jegoli/co_widget/round_icon_button.dart';
import 'package:jegoli/co_widget/round_textfield.dart';
import 'package:jegoli/common/color_extension.dart';
import 'package:jegoli/screens/auth/reset_password_screen.dart';
import 'package:jegoli/screens/auth/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 55),
              Text(
                "Login",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: ColorExtension.primaryText,
                ),
              ),
              Text(
                "Add your details to login",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: ColorExtension.secondaryText,
                ),
              ),
              const SizedBox(height: 25),
              RoundTextfield(
                hintText: "Your Email",
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),
              RoundTextfield(
                hintText: "Your Password",
                controller: passwordController,
                obscureText: true,
              ),
              const SizedBox(height: 20),
              RoundButton(onPressed: () {}, title: "Login"),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ResetPasswordScreen(),
                    ),
                  );
                },
                child: Text(
                  "Forgot your password?",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: ColorExtension.secondaryText,
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "or Login with",
                style: TextStyle(
                  color: ColorExtension.secondaryText,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 20),
              RoundIconButton(
                onPressed: () {},
                title: "Login with Facebook",
                icon: "assets/images/face-lo.png",
                color: const Color(0xff367FC0),
              ),
              const SizedBox(height: 20),
              RoundIconButton(
                onPressed: () {},
                title: "Login with Google",
                icon: "assets/images/go-lo.png",
                color: const Color(0xffDD4B39),
              ),
              const SizedBox(height: 70),
              // RichText to make the "Sign Up" clickable
              RichText(
                text: TextSpan(
                  text: "Don't have an Account? ",
                  style: TextStyle(
                    color: ColorExtension.secondaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: "Sign Up",
                      style: TextStyle(
                        color: ColorExtension.primary,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Navigate to Signup Screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignupScreen()),
                          );
                        },
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
