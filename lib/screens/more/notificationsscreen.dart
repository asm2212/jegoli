import 'package:flutter/material.dart';
import 'package:jegoli/common/color_extension.dart';
import 'package:jegoli/screens/more/my_order_screen.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  List notificationArr = [
 {"title": "Order #1234 has been shipped", "time": "now"},
  {"title": "Your refund request has been processed", "time": "10 mins ago"},
  {"title": "New promotional offer available: 20% off!", "time": "30 mins ago"},
  {"title": "Order #5678 has been delivered", "time": "1 h ago"},
  {"title": "Password changed successfully", "time": "3 h ago"},
  {"title": "New comment on your post", "time": "5 h ago"},
  {"title": "Your subscription will renew on 20 Oct 2024", "time": "Yesterday"},
  {"title": "Your order #9101 is delayed", "time": "05 Oct 2024"},
  {"title": "New friend request from John Doe", "time": "22 Sep 2024"},
  {"title": "App version 2.0 is now available", "time": "10 Aug 2024"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Image.asset(
                    "assets/images/btn_back.png",
                    width: 20,
                    height: 20,
                  ),
                ),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    "Notifications",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                IconButton(
                  onPressed: () {
                         Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: (context) => const MyOrderScreen()));
                  },
                  icon: Image.asset(
                    "assets/images/shopping_cart.png",
                    width: 25,
                    height: 25,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.separated(
                itemCount: notificationArr.length,
                separatorBuilder: (context, index) => Divider(
                  endIndent: 25,
                  indent: 25,
                  color: ColorExtension.secondaryText.withOpacity(0.1),
                  height: 0.6,
                ),
                itemBuilder: ((context, index) {
                  var cObj = notificationArr[index] as Map? ?? {};
                  return Container(
                    decoration: BoxDecoration(
                      color: index % 2 == 0
                          ? ColorExtension.white
                          : ColorExtension.textfield,
                    ),
                    padding:
                        const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                           margin:const  EdgeInsets.only(top: 6),
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: ColorExtension.primary,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                cObj['title'] ?? '',
                                style: TextStyle(
                                  color: ColorExtension.primaryText,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                cObj['time'] ?? '',
                                style: TextStyle(
                                  color: ColorExtension.secondaryText,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
