import 'package:flutter/material.dart';
import 'package:jegoli/common/color_extension.dart';

class MenuItemRow extends StatelessWidget {
  final Map mObj;
  final VoidCallback onTap;

  const MenuItemRow({
    super.key,
    required this.mObj,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: onTap,
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            // Background Image
            Image.asset(
              mObj["image"].toString(),
              width: MediaQuery.of(context).size.width,  
              height: 200,
              fit: BoxFit.cover,
            ),
            // Gradient Overlay for text readability
            Container(
              width: double.maxFinite,
              height: 200,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.black87, // Improved gradient for more contrast
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            // Text and Rating Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Food Name
                  Text(
                    mObj["name"]?.toString() ?? 'Unknown Item',
                    style: TextStyle(
                      color: ColorExtension.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Rating and Type
                  Row(
                    children: [
                      // Rating Icon and Value
                      Image.asset(
                        "assets/images/rate.png",
                        width: 10,
                        height: 10,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        mObj["rate"]?.toString() ?? '0.0',
                        style: TextStyle(
                          color: ColorExtension.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(width: 8),
                      // Food Type
                      Text(
                        mObj["type"]?.toString() ?? 'Unknown Type',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: ColorExtension.white,
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "•", // Dot separator
                        style: TextStyle(
                          color: ColorExtension.primary,
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(width: 4),
                      // Food Category
                      Text(
                        mObj["food_type"]?.toString() ?? 'Unknown Food Type',
                        style: TextStyle(
                          color: ColorExtension.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
