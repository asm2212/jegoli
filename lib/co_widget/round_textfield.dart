// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:jegoli/common/color_extension.dart';

class RoundTextfield extends StatelessWidget {
  final TextEditingController? controller ;
  final String? hintText;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Color? bgColor;
  final Widget? left;
  const RoundTextfield({
    super.key,
    this.hintText,
    this.keyboardType, 
    this.controller, 
    this.obscureText = false, 
    this.bgColor,
     this.left,
  });

  @override
  Widget build(BuildContext context) {
    return    Container(
                decoration: BoxDecoration(
                color: bgColor ?? ColorExtension.textfield,
                borderRadius: BorderRadius.circular(25)
                ),
                child: Row(
                  children: [
                    if(left != null) Padding(
                      padding: const EdgeInsets.only(left: 15,),
                      child: left,
                      ),
                    Expanded(
                      child: TextField(
                        autocorrect: false,
                        controller: controller,
                        obscureText: obscureText,
                        keyboardType: keyboardType,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 20,),
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
                    ),
                  ],
                ),
              );
  }
}
