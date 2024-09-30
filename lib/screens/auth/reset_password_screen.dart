import 'package:flutter/material.dart';
import 'package:jegoli/co_widget/round_button.dart';
import 'package:jegoli/co_widget/round_textfield.dart';
import 'package:jegoli/common/color_extension.dart';
import 'package:jegoli/screens/auth/new_password_screen.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Text(
                "Reset Password",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                    color: ColorExtension.primaryText),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Please enter your email to receive a link to create a new password",
                style: TextStyle(
                    fontSize: 14,
                    color: ColorExtension.secondaryText,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 50,
              ),
              RoundTextfield(
                hintText: "Your Email",
                controller: emailController,
                obscureText: true,
              ),
              const SizedBox(
                height: 30,
              ),
              RoundButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const NewPasswordScreen())); 
              }, title: "Send"),
            ],
          ),
        ),
      ),
    );
  }
}
