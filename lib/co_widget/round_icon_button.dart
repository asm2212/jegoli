import 'package:flutter/material.dart';
import 'package:jegoli/common/color_extension.dart';

class RoundIconButton extends StatelessWidget {

  final String title;
  final String icon;
  final Color color;
  final VoidCallback onPressed;
  final double fontSize;
  final FontWeight fontWeight;
  const RoundIconButton(
      {super.key,
      required this.onPressed,
      required this.title,
      required this.icon,
      required this.color,
      this.fontWeight=FontWeight.w500,
      this.fontSize = 12
      });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 56,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(28),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              icon,
              width: 15,
              height: 15,
              fit: BoxFit.contain,
              ),
              const SizedBox(width: 8,),
            Text(
              title,
              style: TextStyle(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w400,
                  color: ColorExtension.white),
            ),
          ],
        ),
      ),
    );
  }
}
