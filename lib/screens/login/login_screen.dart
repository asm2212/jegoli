import 'package:flutter/material.dart';
import 'package:jegoli/co_widget/round_button.dart';
import 'package:jegoli/co_widget/round_icon_button.dart';
import 'package:jegoli/co_widget/round_textfield.dart';
import 'package:jegoli/common/color_extension.dart';

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
          padding: const EdgeInsets.symmetric(vertical: 20,horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 55,),
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
            const SizedBox(height: 25,),
            RoundTextfield(
              hintText: "Your Email",
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20,),
            RoundTextfield(
              hintText: "Your Password",
              controller: passwordController,
              obscureText: true,
            ),
            const SizedBox(height: 20,),
            RoundButton(onPressed: (){}, title: "Login"),
            TextButton(
              onPressed: (){}, 
              child: Text(
                "Forgot your password?",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: ColorExtension.secondaryText,
                  ),
                )
              ),
              const SizedBox(height: 30,),
              Text(
                "or Login with",
                style: TextStyle(
                  color: ColorExtension.secondaryText,
                  fontSize: 14,
                  fontWeight: FontWeight.w400
                ),
              ),
              const SizedBox(height: 20,),
              RoundIconButton(onPressed: (){}, title: "Login with Facebook", icon: "assets/images/face-lo.png", color:  const Color(0xff367FC0)),
               const SizedBox(height: 20,),
              RoundIconButton(onPressed: (){}, title: "Login with Google", icon: "assets/images/go-lo.png", color:   const Color(0xffDD4B39)),
              const SizedBox(height: 70,),
              TextButton(
                onPressed: (){},
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                      Text(
                      "Don't have an Account? ",
                      style: TextStyle(
                        color: ColorExtension.secondaryText,
                        fontSize: 14,
                        fontWeight: FontWeight.w400
                        ),
                    ),
                    Text(
                      "Sign Up",
                      style: TextStyle(
                        color: ColorExtension.primary,
                        fontSize: 14,
                        fontWeight: FontWeight.w700
                        ),
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