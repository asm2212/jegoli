import 'package:flutter/material.dart';
import 'package:jegoli/co_widget/round_button.dart';
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        "assets/images/shop_logo.png",
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                        ),
                    ),
                    const SizedBox(width: 8,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "King Burgers",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700
                            ),
                            ),
                            const SizedBox(height:4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset("assets/images/rate.png",
                                   width:10,
                                   height: 10,
                                   fit: BoxFit.cover,
                                ),
                                const SizedBox(width: 4,),
                                Text(
                                  "4.9",
                                  textAlign: TextAlign.center,
                                   style: TextStyle(
                                     fontSize: 11,
                                     color: ColorExtension.primary
                                     
                                   ),
                               
                                  
                                ),
                                    const SizedBox(width: 8,),
                                    Text(
                                      "{124 Ratings}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: ColorExtension.secondaryText,
                                        fontSize: 11,
                                      ),
                                    ),
                                   
                              ],

                            ),
                                 const SizedBox(height:4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                               
                                    Text(
                                      "Burger",
                                      textAlign: TextAlign.center,
                                       style: TextStyle(
                                          fontSize: 11,
                                          color: ColorExtension.secondaryText,
                                        ),
                                    ),
                                    Text(
                                      ".",
                                      textAlign: TextAlign.center,
                                       style: TextStyle(
                                          fontSize: 11,
                                          color: ColorExtension.primary,
                                        ),
                                    ),
                                     Text(
                                      "Western Food",
                                      textAlign: TextAlign.center,
                                       style: TextStyle(
                                          fontSize: 12,
                                          color: ColorExtension.secondaryText,
                                        ),
                                     ),
                              ],

                            ),
                                 const SizedBox(height:4),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset("assets/images/location-pin.png",
                                   width:13,
                                   height: 13,
                                   fit: BoxFit.contain,
                                ),
                                const SizedBox(width: 4,),
                                Expanded(
                                  child: Text(
                                    "No 03,4th Lane,Newyork",
                                    textAlign: TextAlign.left,
                                     style: TextStyle(
                                       fontSize: 12,
                                       color: ColorExtension.secondaryText
                                       
                                     ),
                                                                 
                                    
                                  ),
                                ),
                                    
                                    
                              ],

                            )
                        ],
                      ),)
                  ]
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(color: ColorExtension.textfield),
                child: ListView.separated(
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
                        "Delivery Instruction",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13,
                          color: ColorExtension.primaryText,
                        fontWeight: FontWeight.w700
                        ),
                      ),
                      TextButton.icon(
                        onPressed: (){}, 
                        icon: Icon(Icons.add,color: ColorExtension.primary,),
                        label: Text(
                          "Add Notes",
                          style: TextStyle(
                            color: ColorExtension.primary,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          )
                        )
                        )
                    ],
                  ),
                  Divider(
                    color: ColorExtension.primaryText.withOpacity(0.1),
                    thickness: 1,
                  ),
                  const SizedBox(height: 8,),
                     Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sub Total",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13,
                          color: ColorExtension.primaryText,
                        fontWeight: FontWeight.w700
                        ),
                      ),
                     
                         Text(
                          "\$100",
                          style: TextStyle(
                            color: ColorExtension.primary,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          )
                        )
                        
                    ],
                  ),
                     const SizedBox(height: 4,),
                      Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Delivery Cost",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13,
                          color: ColorExtension.primaryText,
                        fontWeight: FontWeight.w700
                        ),
                      ),
                     
                         Text(
                          "\$8",
                          style: TextStyle(
                            color: ColorExtension.primary,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          )
                        )
                        
                    ],
                  ),
                    Divider(
                    color: ColorExtension.primaryText.withOpacity(0.1),
                    thickness: 1,
                  ),
                     const SizedBox(height: 8,),
                    Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 13,
                          color: ColorExtension.primaryText,
                        fontWeight: FontWeight.w700
                        ),
                      ),
                     
                         Text(
                          "\$108",
                          style: TextStyle(
                            color: ColorExtension.primary,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          )
                        )
                        
                    ],
                  ),
                  const SizedBox(height: 25,),
                  RoundButton(onPressed: (){}, title: "Checkout"),
                const SizedBox(height: 55,),
                ],
              )
              )
            ],
          ),
        ),
      ),
    );
  }
}
