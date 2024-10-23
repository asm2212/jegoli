import 'package:flutter/material.dart';
import 'package:jegoli/common/color_extension.dart';
import 'package:jegoli/screens/more/about_us_screen.dart';
import 'package:jegoli/screens/more/example_screen.dart';
import 'package:jegoli/screens/more/notificationsscreen.dart';
import 'package:jegoli/screens/more/payment_details_screen.dart';
import 'package:jegoli/screens/more/placeholder_screen.dart';


class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  List moreArr = [
    {
      "index": "1",
      "name": "Payment Details",
      "image": "assets/images/more_payment.png",
      "base": 0,
      "screen": const PaymentDetailsScreen(), // Add screen navigation here
    },
    {
      "index": "2",
      "name": "My Orders",
      "image": "assets/images/more_my_order.png",
      "base": 0,
    "screen": const PlaceholderScreen(),// Define this screen
    },
    {
      "index": "3",
      "name": "Notifications",
      "image": "assets/images/more_notification.png",
      "base": 15,
      "screen": const NotificationsScreen(), // Define this screen
    },
    {
      "index": "4",
      "name": "Inbox",
      "image": "assets/images/more_inbox.png",
      "base": 0,
      "screen": const ExampleScreen(), // Define this screen
    },
    {
      "index": "5",
      "name": "About Us",
      "image": "assets/images/more_info.png",
      "base": 0,
       "screen": const AboutUsScreen(), // Define this screen
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'More',
                      style: TextStyle(
                        color: ColorExtension.primaryText,
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        // Implement shopping cart functionality
                      },
                      icon: Image.asset(
                        "assets/images/shopping_cart.png",
                        width: 25,
                        height: 25,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: moreArr.length,
                itemBuilder: (context, index) {
                  var mObj = moreArr[index] as Map? ?? {};
                  var countBase = mObj["base"] as int? ?? 0;

                  return InkWell(
                    onTap: () {
                      // Navigate to the respective screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => mObj["screen"],
                        ),
                      );
                    },
                    child: Stack(
                      children: [
                        // Main content container
                        Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 20,
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                            horizontal: 12,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: ColorExtension.textfield,
                          ),
                          child: Row(
                            children: [
                              // Circular background for icon/image
                              Container(
                                width: 45,
                                height: 45,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Image.asset(
                                    mObj["image"] ?? "",
                                    width: 25,
                                    height: 25,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 15),
                              // Text for the item
                              Expanded(
                                child: Text(
                                  mObj["name"] ?? "",
                                  style: TextStyle(
                                    color: ColorExtension.primaryText,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              // Notification badge (if applicable)
                              if (countBase > 0)
                                Container(
                                  width: 25,
                                  height: 25,
                                  decoration: const BoxDecoration(
                                    color: Colors.red,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Text(
                                      countBase.toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                        // Positioned arrow outside the main container
                        Positioned(
                          right: 10,
                          top: 32,
                          child: Icon(
                            Icons.arrow_forward_ios,
                            size: 18,
                            color: ColorExtension.primaryText,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
             const SizedBox(height:80),
            ],
          ),
        ),
      ),
    );
  }
}
