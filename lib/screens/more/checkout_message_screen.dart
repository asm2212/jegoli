import 'package:flutter/material.dart';
import 'package:jegoli/co_widget/round_button.dart';
import 'package:jegoli/common/color_extension.dart';
import 'package:jegoli/screens/home/home_screen.dart';

class CheckoutMessageScreen extends StatefulWidget {
  const CheckoutMessageScreen({super.key});

  @override
  State<CheckoutMessageScreen> createState() => _CheckoutMessageScreenState();
}

class _CheckoutMessageScreenState extends State<CheckoutMessageScreen> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Material( 
      color: Colors.transparent, 
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        width: media.width,
        decoration: BoxDecoration(
          color: ColorExtension.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: Icon(
                    Icons.close,
                    color: ColorExtension.primaryText,
                    size: 25,
                  ),
                ),
              ],
            ),
            Image.asset(
              "assets/images/thank_you.png",
              width: media.width * 0.55,
            ),
            const SizedBox(height: 20),
            Text(
              "Thank You!",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w700,
                color: ColorExtension.primaryText,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "for your order",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color: ColorExtension.primaryText,
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                "Your order is now being processed. We will let you know once the order is picked from the outlet.\nCheck the status of your Order",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: ColorExtension.secondaryText,
                ),
              ),
            ),
            const SizedBox(height: 25),
            RoundButton(
              onPressed: () {},
              title: "Track My Order",
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              child: Text(
                "Back To Home",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: ColorExtension.primaryText,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }
}
