import 'package:flutter/material.dart';
import 'package:jegoli/common/color_extension.dart';

class ViewAllTitleRow extends StatelessWidget {
  final String title;
  final VoidCallback onView;
  const ViewAllTitleRow({super.key, required this.title, required this.onView});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Text(
        title,
        style: TextStyle(
            color: ColorExtension.primaryText,
            fontSize: 20,
            fontWeight: FontWeight.w800),
      ),
      TextButton(
          onPressed: onView,
          child: Text(
            "View all",
            style: TextStyle(
                color: ColorExtension.primary,
                fontSize: 12,
                fontWeight: FontWeight.w500),
          ))
    ]);
  }
}
