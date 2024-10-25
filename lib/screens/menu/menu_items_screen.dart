import 'package:flutter/material.dart';
import 'package:jegoli/co_widget/menu_item_row.dart';
import 'package:jegoli/co_widget/round_textfield.dart';
import 'package:jegoli/common/color_extension.dart';
import 'package:jegoli/screens/menu/item_details_screen.dart';
import 'package:jegoli/screens/more/my_order_screen.dart';

class MenuItemsScreen extends StatefulWidget {
  final Map mObj;
  const MenuItemsScreen({super.key, required this.mObj});

  @override
  State<MenuItemsScreen> createState() => _MenuItemsScreenState();
}

class _MenuItemsScreenState extends State<MenuItemsScreen> {
  TextEditingController searchController = TextEditingController();

  List menuItemsArr = [
    {
      "image": "assets/images/dess_1.png",
      "name": "French Apple Pie",
      "rate": "4.9",
      "rating": "124",
      "type": "Special Fizza",
      "food_type": "Desserts"
    },
    {
      "image": "assets/images/dess_2.png",
      "name": "Dark Chocolate Cake",
      "rate": "4.9",
      "rating": "124",
      "type": "cakes by Tella",
      "food_type": "Western Food"
    },
    {
      "image": "assets/images/dess_3.png",
      "name": "Street Shake",
      "rate": "4.9",
      "rating": "124",
      "type": "cafe Racer",
      "food_type": "Desserts"
    },
    {
      "image": "assets/images/dess_4.png",
      "name": "Bakes by Tella",
      "rate": "4.9",
      "rating": "124",
      "type": "cafe",
      "food_type": "Western Food"
    },
       {
      "image": "assets/images/dess_1.png",
      "name": "French Apple Pie",
      "rate": "4.9",
      "rating": "124",
      "type": "Special Fizza",
      "food_type": "Desserts"
    },
    {
      "image": "assets/images/dess_2.png",
      "name": "Dark Chocolate Cake",
      "rate": "4.9",
      "rating": "124",
      "type": "cakes ",
      "food_type": "Western Food"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              const SizedBox(height: 45),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
             
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        "assets/images/btn_back.png",
                        width: 20,
                        height: 20,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      widget.mObj["name"].toString(),
                      style: TextStyle(
                        color: ColorExtension.primaryText,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
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
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RoundTextfield(
                  hintText: "Search Food",
                  controller: searchController,
                  left: Container(
                    alignment: Alignment.center,
                    width: 30,
                    child: Image.asset(
                      "assets/images/search.png",
                      width: 20,
                      height: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: menuItemsArr.length,
                itemBuilder: (context, index) {
                  var mObj = menuItemsArr[index] as Map? ?? {};
                  return MenuItemRow(mObj: mObj, onTap: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context)=> const ItemDetailsScreen()),
                    );
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
