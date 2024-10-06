import 'package:flutter/material.dart';
import 'package:jegoli/common/color_extension.dart';

class RecentItemRow extends StatelessWidget {
  final Map rObj;
  final VoidCallback onTap;
  const RecentItemRow({
    super.key,
    required this.rObj,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                rObj["image"]?.toString() ?? 'assets/images/default_image.png', // Fallback image
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 8),
            Expanded( // Prevent overflow by using Expanded
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    rObj["name"]?.toString() ?? 'Unknown Item', // Fallback name
                    style: TextStyle(
                      color: ColorExtension.primaryText,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: 1, // Limit to a single line
                    overflow: TextOverflow.ellipsis, // Handle long text with ellipsis
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          rObj["type"]?.toString() ?? 'Unknown Type', // Fallback type
                          style: TextStyle(
                            color: ColorExtension.secondaryText,
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
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
                      Flexible(
                        child: Text(
                          rObj["food_type"]?.toString() ?? 'Unknown Food Type', // Fallback food type
                          style: TextStyle(
                            color: ColorExtension.secondaryText,
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      // const SizedBox(width: 4),
                      // Image.asset(
                      //   "assets/images/rate.png",
                      //   width: 10,
                      //   height: 10,
                      //   fit: BoxFit.cover,
                      // ),
                      // const SizedBox(width: 4),
                      // Text(
                      //   rObj["rate"]?.toString() ?? '0.0', // Fallback rate
                      //   style: TextStyle(
                      //     color: ColorExtension.primary,
                      //     fontSize: 11,
                      //     fontWeight: FontWeight.w700,
                      //   ),
                      // ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Image.asset(
                        "assets/images/rate.png",
                        width: 10,
                        height: 10,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        rObj["rate"]?.toString() ?? '0.0', // Fallback rate
                        style: TextStyle(
                          color: ColorExtension.primary,
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        "(${rObj["rating"]?.toString() ?? '0'} Ratings)", // Fallback rating
                        style: TextStyle(
                          color: ColorExtension.secondaryText,
                          fontSize: 11,
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
