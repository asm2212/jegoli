import 'package:flutter/material.dart';
import 'package:jegoli/co_widget/round_button.dart';
import 'package:jegoli/common/color_extension.dart';
import 'package:otp_pin_field/otp_pin_field.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _otpPinFieldController = GlobalKey<OtpPinFieldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Shrink-wrap the column to its children
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 50),
              Text(
                "We have sent an OTP to your Mobile",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: ColorExtension.primaryText,
                    fontSize: 28,
                    fontWeight: FontWeight.w800),
              ),
              const SizedBox(height: 15),
              Text(
                "Please check your mobile number\n091****34 to continue resetting your password",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: ColorExtension.secondaryText,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 60),

              // Use Flexible with FlexFit.loose to avoid expanding infinitely
              Flexible(
                fit: FlexFit.loose,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 300), // Set max width
                  child: OtpPinField(
                    key: _otpPinFieldController,
                    autoFillEnable: true,
                    textInputAction: TextInputAction.done,
                    onSubmit: (newCode) {
                      // Handle OTP submission
                    },
                    onChange: (newCode) {
                      // Handle OTP change
                    },
                    onCodeChanged: (newCode) {
                      // Handle OTP code change
                    },

                    // Reduced field width to prevent overflow
                    fieldWidth: 35,

                    otpPinFieldStyle: OtpPinFieldStyle(
                      defaultFieldBorderColor: Colors.transparent,
                      activeFieldBorderColor: Colors.transparent,
                      defaultFieldBackgroundColor: ColorExtension.textfield,
                      activeFieldBackgroundColor: ColorExtension.textfield,
                    ),
                    maxLength: 4,
                    showCursor: true,
                    cursorColor: ColorExtension.placeholder,
                    cursorWidth: 3,
                    otpPinFieldDecoration:
                        OtpPinFieldDecoration.defaultPinBoxDecoration,
                  ),
                ),
              ),

              const SizedBox(height: 30),
              RoundButton(
                title: "Next",
                onPressed: () {
                  FocusScope.of(context).requestFocus(FocusNode());
                },
              ),
              TextButton(
                onPressed: () {
                  // Handle resend OTP logic
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "Didn't Receive? ",
                      style: TextStyle(
                        color: ColorExtension.secondaryText,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      "Click Here",
                      style: TextStyle(
                        color: ColorExtension.primary,
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
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
