// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:jegoli/common/color_extension.dart';

class RoundTextfield extends StatelessWidget {
  final TextEditingController? controller ;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  const RoundTextfield({
    super.key,
    this.hintText,
    this.keyboardType, 
    this.controller, 
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return    Container(
                decoration: BoxDecoration(
                color: ColorExtension.textfield,
                borderRadius: BorderRadius.circular(25)
                ),
                child: TextField(
                  autocorrect: false,
                  controller: controller,
                  obscureText: obscureText,
                  keyboardType: keyboardType,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 0),
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: hintText,
                    hintStyle: TextStyle(
                      color: ColorExtension.placeholder,
                      fontSize: 14,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  ),
              );
  }
}
