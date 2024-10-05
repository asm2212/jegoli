import 'package:flutter/material.dart';
import 'package:jegoli/common/color_extension.dart';

class TabButton extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final String icon;
  final bool isSelected;
  
  const TabButton({super.key, required this.onTap, required this.title, required this.isSelected, required this.icon});

  @override
  Widget build(BuildContext context) {
    return   InkWell(
              onTap: onTap,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    icon,
                    width: 15,
                    height: 15,
                    color: isSelected ? ColorExtension.primary : ColorExtension.placeholder,
                    ), 
                  const SizedBox(height: 4,),
                    Text(
                     title,
                      style: TextStyle(
                        color: isSelected ? ColorExtension.primary : ColorExtension.placeholder,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                ],
              ),
            );
  }
}