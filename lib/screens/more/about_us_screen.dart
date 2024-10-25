import 'package:flutter/material.dart';
import 'package:jegoli/common/color_extension.dart';
import 'package:jegoli/screens/more/my_order_screen.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  List aboutTextArr = [
    "Meaningful Content: Titles now reflect different user interactions or system updates, which is more realistic for an application with notifications.",
    "Engaging Interface: Animations are more fluid, which can make the application more engaging and intuitive.",
    "Enhanced Visual Appeal: The application's color scheme is more sophisticated, with gradients and transitions, which can make the application more visually appealing.",
    "Responsive Design: The application's layout is more responsive, which can make the application more user-friendly on different devices."
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
                    "About Us",
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
              child: ListView.builder(
                itemCount: aboutTextArr.length,
                
                itemBuilder: (context, index) {
                  var text = aboutTextArr[index] as String? ?? "";
                  return Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin:const  EdgeInsets.only(top: 10),
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: ColorExtension.primary,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Text(
                            text,
                            style: TextStyle(
                              color: ColorExtension.primaryText,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
