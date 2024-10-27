import 'package:flutter/material.dart';
import 'package:jegoli/co_widget/round_button.dart';
import 'package:jegoli/common/color_extension.dart';
import 'package:jegoli/screens/more/change_address.dart';
import 'package:jegoli/screens/more/checkout_message_screen.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final List<Map<String, String>> paymentArr = [
    {'name': 'Cash on delivery', 'icon': 'assets/images/cash.png'},
    {'name': '*** *** ***', 'icon': 'assets/images/visa_icon.png'},
    {'name': 'asm2212@gmail.com', 'icon': 'assets/images/paypal.png'},
  ];

  int selectMethod = -1;

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
                  Expanded(
                    child: Text(
                      "Checkout",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Delivery Address",
                            style: TextStyle(
                              color: ColorExtension.secondaryText,
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "653 Nostrand AVe..,\n Brooklyn,NY 11216",
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 30),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ChangeAddress()),
                                  );
                                },
                                child: Text(
                                  "Change",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: ColorExtension.primary,
                                  ),
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
              Divider(
                color: ColorExtension.primaryText.withOpacity(0.1),
                thickness: 10,
              ),
              const SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(color: ColorExtension.textfield),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Payment method",
                          style: TextStyle(
                            fontSize: 13,
                            color: ColorExtension.primaryText,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.add, color: ColorExtension.primary),
                          label: Text(
                            "Add Card",
                            style: TextStyle(
                              color: ColorExtension.primary,
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: paymentArr.length,
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        var pObj = paymentArr[index];
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 6),
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 15),
                          decoration: BoxDecoration(
                            color: ColorExtension.textfield,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: ColorExtension.secondaryText.withOpacity(0.2),
                            ),
                          ),
                          child: Row(
                            children: [
                              Image.asset(
                                pObj["icon"].toString(),
                                width: 50,
                                height: 20,
                                fit: BoxFit.contain,
                              ),
                              Expanded(
                                child: Text(
                                  pObj["name"].toString(),
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: ColorExtension.primaryText,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    selectMethod = index;
                                  });
                                },
                                child: Icon(
                                  selectMethod == index
                                      ? Icons.radio_button_on
                                      : Icons.radio_button_off,
                                  color: ColorExtension.primary,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 4),
                    Divider(
                      color: ColorExtension.primaryText.withOpacity(0.1),
                      thickness: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sub Total",
                          style: TextStyle(
                            fontSize: 13,
                            color: ColorExtension.primaryText,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "\$100",
                          style: TextStyle(
                            color: ColorExtension.primaryText,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Delivery Cost",
                          style: TextStyle(
                            fontSize: 13,
                            color: ColorExtension.primaryText,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "\$5",
                          style: TextStyle(
                            color: ColorExtension.primaryText,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Discount",
                          style: TextStyle(
                            fontSize: 13,
                            color: ColorExtension.primaryText,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "-\$10",
                          style: TextStyle(
                            color: ColorExtension.primaryText,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: ColorExtension.primaryText.withOpacity(0.1),
                      thickness: 1,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: TextStyle(
                            fontSize: 13,
                            color: ColorExtension.primaryText,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "\$95",
                          style: TextStyle(
                            color: ColorExtension.primaryText,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      color: ColorExtension.primaryText.withOpacity(0.1),
                      thickness: 10,
                    ),
                    const SizedBox(height: 25),
                    RoundButton(onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        isScrollControlled: true,
                         builder: (context){
                        return const CheckoutMessageScreen();
                      });
                    
                    }, title: "Send Order"),
                    const SizedBox(height: 55),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
