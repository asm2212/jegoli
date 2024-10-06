import 'package:flutter/material.dart';
import 'package:jegoli/common/color_extension.dart';

class MostPopularCell extends StatelessWidget {
  final Map mObj;
  final VoidCallback onTap;

  const MostPopularCell({
    super.key,
    required this.mObj,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                mObj["image"].toString(),
                width: 220,
                height: 130,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              mObj["name"],
              textAlign: TextAlign.center,
              style: TextStyle(
                color: ColorExtension.primaryText,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  mObj["name"],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorExtension.primaryText,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  mObj["type"],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorExtension.secondaryText,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  " . ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorExtension.primary,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  mObj["food_type"],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorExtension.secondaryText,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(width: 8,),
                Image.asset(
                  "assets/images/rate.png",
                  width: 10,
                  height: 10,
                  fit: BoxFit.cover,
                ),
                const SizedBox(width: 4,),
                Text(
                  mObj["rate"].toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ColorExtension.primary,
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}