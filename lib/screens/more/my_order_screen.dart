import 'package:flutter/material.dart';
import 'package:jegoli/common/color_extension.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({super.key});

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  List<Map<String, dynamic>> itemArr = [
    {
      "name": "Beef Burger",
      "quantity": 2,
      "price": 15,
    },
    {
      "name": "Chicken Burger",
      "quantity": 1,
      "price": 10,
    },
    {
      "name": "French Fries",
      "quantity": 3,
      "price": 50,
    },
    {
      "name": "Pizza",
      "quantity": 1,
      "price": 30,
    },
    {
      "name": "Shake",
      "quantity": 1,
      "price": 10,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorExtension.white,
      body: SingleChildScrollView(
        child: Padding(
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
                      "My Order",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ListView.separated(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: itemArr.length,
                separatorBuilder: (context, index) => Divider(
                  indent: 35,
                  endIndent: 35,
                  color: ColorExtension.secondaryText.withOpacity(0.1),
                  height: 1,
                ),
                itemBuilder: (context, index) {
                  var cObj = itemArr[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: ColorExtension.textfield,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          spreadRadius: 1,
                          blurRadius: 3,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                    margin: const EdgeInsets.symmetric(vertical: 5), // Added margin between containers
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            "${cObj['name']} x${cObj['quantity']}",
                            style: TextStyle(
                              fontSize: 14,
                              color: ColorExtension.primaryText,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Text(
                          "\$ ${cObj['price']}",
                          style: TextStyle(
                            fontSize: 14,
                            color: ColorExtension.primaryText,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
