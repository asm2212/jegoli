import 'package:flutter/material.dart';
import 'package:jegoli/common/color_extension.dart';

class PopularRestaurantRow extends StatelessWidget {
  final Map pObj;
  final VoidCallback onTap;

  const PopularRestaurantRow({
    super.key,
    required this.pObj,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section
            Image.asset(
              pObj["image"]?.toString() ??
                  'assets/images/default_image.png', // Fallback image
              width: MediaQuery.of(context).size.width, // Use the screen width
              height: 200, // Set fixed height
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 8),
            const SizedBox(height: 12),
            // Text and Rating Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    pObj["name"]?.toString() ?? 'Unknown Item', // Fallback name
                    style: TextStyle(
                      color: ColorExtension.primaryText,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/images/rate.png",
                        width: 10,
                        height: 10,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        pObj["rate"]?.toString() ?? '0.0', // Fallback rate
                        style: TextStyle(
                          color: ColorExtension.primary,
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "(${pObj["rating"]?.toString() ?? '0'} Ratings)",
                        style: TextStyle(
                          color: ColorExtension.secondaryText,
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        " . ",
                        style: TextStyle(
                          color: ColorExtension.primary,
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        pObj["food_type"]?.toString() ?? 'Unknown Food Type',
                        style: TextStyle(
                          color: ColorExtension.secondaryText,
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
