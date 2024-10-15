import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:jegoli/co_widget/round_button.dart';
import 'package:jegoli/co_widget/round_textfield.dart';
import 'package:jegoli/common/color_extension.dart';
import 'package:jegoli/screens/auth/login_screen.dart';
import 'package:jegoli/screens/auth/otp_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 55,),
              Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  color: ColorExtension.primaryText,
                  ),
              ),
                Text(
                "Add your details to sign up",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: ColorExtension.secondaryText,
                   ),
              ),
            const SizedBox(height: 25,),
            RoundTextfield(
              hintText: "Name",
              controller: nameController,
              keyboardType: TextInputType.name,
            ),
            const SizedBox(height: 20,),
            RoundTextfield(
              hintText: "Email",
              controller: emailController,
              obscureText: true,
            ),
             const SizedBox(height: 20,),
            RoundTextfield(
              hintText: "Mobile No",
              controller: mobileNumberController,
              obscureText: true,
            ),
             const SizedBox(height: 20,),
            RoundTextfield(
              hintText: "Address",
              controller: addressController,
              obscureText: true,
            ),
             const SizedBox(height: 20,),
            RoundTextfield(
              hintText: "Password",
              controller: passwordController,
              obscureText: true,
            ),
             const SizedBox(height: 20,),
            RoundTextfield(
              hintText: "Confirm Password",
              controller: confirmPasswordController,
              obscureText: true,
            ),
            const SizedBox(height: 20,),
            RoundButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const OtpScreen()),
              );
            }, title: "Sign Up"),
              const SizedBox(height: 30,),
                RichText(
                text: TextSpan(
                  text: "Already have an Account? ",
                  style: TextStyle(
                    color: ColorExtension.secondaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: "Login",
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
                                builder: (context) => const LoginScreen()),
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