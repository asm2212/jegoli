import 'package:flutter/material.dart';
import 'package:jegoli/common/color_extension.dart';

enum RoundButtonType { bgPrimary, textPrimary }

class RoundButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final RoundButtonType type;
  const RoundButton(
      {super.key,
      required this.onPressed,
      required this.title,
      this.type = RoundButtonType.bgPrimary});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 56,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: type == RoundButtonType.bgPrimary
              ? null
              : Border.all(color: ColorExtension.primary, width: 1),
          borderRadius: BorderRadius.circular(28),
          color: type == RoundButtonType.bgPrimary
              ? ColorExtension.primary
              : ColorExtension.white,
        ),
        child: Text(
          title,
          style:  TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: type == RoundButtonType.bgPrimary
                ? ColorExtension.white
                : ColorExtension.primary,
          ),
        ),
      ),
    );
  }
}
