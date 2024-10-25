import 'package:flutter/material.dart';
import 'package:jegoli/common/color_extension.dart';
import 'package:jegoli/screens/more/my_order_screen.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {

List inboxArr = [
  {"title": "Order #1234 has been shipped", "detail": "Your order has been shipped and is on its way!"},
  {"title": "Your refund request has been processed", "detail": "The refund for your order has been processed successfully."},
  {"title": "New promotional offer available: 20% off!", "detail": "Use code SAVE20 at checkout to get 20% off your next purchase."},
  {"title": "Order #5678 has been delivered", "detail": "Your order has been delivered! Check it out."},
  {"title": "Password changed successfully", "detail": "Your account password has been changed. If this wasn't you, please reset your password."},
  {"title": "New comment on your post", "detail": "John Doe commented on your post: 'Great article!'" },
  {"title": "Your subscription will renew on 20 Oct 2024", "detail": "Your subscription will automatically renew on 20th October 2024."},
  {"title": "Your order #9101 is delayed", "detail": "There is a delay with your order. We will keep you updated."},
  {"title": "New friend request from John Doe", "detail": "John Doe has sent you a friend request. Check your notifications!"},
  {"title": "App version 2.0 is now available", "detail": "Version 2.0 is live! Check out the new features and improvements."},
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
                    "Inbox",
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
                itemCount: inboxArr.length,
                separatorBuilder: (context, index) => Divider(
                  endIndent: 25,
                  indent: 25,
                  color: ColorExtension.secondaryText.withOpacity(0.1),
                  height: 0.6,
                ),
                itemBuilder: ((context, index) {
                  var cObj = inboxArr[index] as Map? ?? {};
                  return Container(
                    decoration: BoxDecoration(
                      color: index % 4 != 1
                          ? ColorExtension.white
                          : ColorExtension.textfield,
                    ),
                    padding:
                        const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                           margin:const  EdgeInsets.only(top: 4),
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
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                cObj['detail'].toString(),
                                maxLines: 2,
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
