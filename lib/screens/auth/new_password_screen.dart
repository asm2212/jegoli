import 'package:flutter/material.dart';
import 'package:jegoli/co_widget/round_button.dart';
import 'package:jegoli/co_widget/round_textfield.dart';
import 'package:jegoli/common/color_extension.dart';

class NewPasswordScreen extends StatefulWidget {
  const NewPasswordScreen({super.key});
  @override
  State<NewPasswordScreen> createState() => _NewPasswordScreenState();
}

class _NewPasswordScreenState extends State<NewPasswordScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              Text(
                "New Password",
                style: TextStyle(
                    color: ColorExtension.primaryText,
                    fontSize: 30,
                    fontWeight: FontWeight.w800),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "Please enter your new password",
                style: TextStyle(
                    color: ColorExtension.secondaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 50,
              ),
              RoundTextfield(
                hintText: "New Password",
                controller: passwordController,
                obscureText: true,
              ),
              const SizedBox(
                height: 25,
              ),
               RoundTextfield(
                hintText: "Confirm Password",
                controller: confirmPasswordController,
                obscureText: true,
              ),
              const SizedBox(
                height: 30,
              ),
              RoundButton(title: "Next", onPressed: () {
              }),
            ],
          ),
        ),
      ),
    );
  }
}