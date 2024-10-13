import 'package:flutter/material.dart';
import 'package:jegoli/co_widget/category_cell.dart';
import 'package:jegoli/co_widget/most_popular_cell.dart';
import 'package:jegoli/co_widget/popular_restaurant_row.dart';
import 'package:jegoli/co_widget/recent_item_row.dart';
import 'package:jegoli/co_widget/round_textfield.dart';
import 'package:jegoli/co_widget/view_all_title_row.dart';
import 'package:jegoli/common/color_extension.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchController = TextEditingController();

  List catArr = [
    {"image": "assets/images/injera.jpg", "name": "InjDishes"},
    {"image": "assets/images/cat_sri.png", "name": "VegeDishes"},
    {"image": "assets/images/cat_3.png", "name": "Italian"},
    {"image": "assets/images/cat_4.png", "name": "Indian"},
  ];

  List popArr = [
    {
      "image": "assets/images/res_1.png",
      "name": "Special Fizza",
      "rate": "4.9",
      "rating": "124",
      "type": "cafe",
      "food_type": "Western Food"
    },
    {
      "image": "assets/images/res_2.png",
      "name": "ChickenSizz",
      "rate": "4.9",
      "rating": "124",
      "type": "cafe",
      "food_type": "Western Food"
    },
    {
      "image": "assets/images/res_3.png",
      "name": "Bakes by Tella",
      "rate": "4.9",
      "rating": "124",
      "type": "cafe",
      "food_type": "Western Food"
    },
  ];

  List mostPopArr = [
    {
      "image": "assets/images/m_res_1.png",
      "name": "Special Fizza",
      "rate": "4.9",
      "rating": "124",
      "type": "cafe",
      "food_type": "Western Food"
    },
    {
      "image": "assets/images/m_res_2.png",
      "name": "ChickenSizz",
      "rate": "4.9",
      "rating": "124",
      "type": "cafe",
      "food_type": "Western Food"
    },
  ];

  List recentArr = [
    {
      "image": "assets/images/item_1.png",
      "name": "Mulberry Pizza by Josh",
      "rate": "4.9",
      "rating": "124",
      "type": "cafe",
      "food_type": "Western Food"
    },
    {
      "image": "assets/images/whChic.jpg",
      "name": "FChiken",
      "rate": "4.9",
      "rating": "124",
      "type": "cafe",
      "food_type": "Western Food"
    },
    {
      "image": "assets/images/sandchi.jpg",
      "name": "Sand Wich",
      "rate": "4.9",
      "rating": "124",
      "type": "cafe",
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Welcome Asm!",
                      style: TextStyle(
                        color: ColorExtension.primaryText,
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    IconButton(
                      onPressed: () {},
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Delivering to",
                      style: TextStyle(
                        color: ColorExtension.secondaryText,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Current Location",
                          style: TextStyle(
                            color: ColorExtension.primaryText,
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(width: 22),
                        Image.asset(
                          "assets/images/dropdown.png",
                          width: 13,
                          height: 13,
                        ),
                      ],
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
              const SizedBox(height: 30),
              SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: catArr.length,
                  itemBuilder: (context, index) {
                    var cObj = catArr[index] as Map? ?? {};
                    return CategoryCell(cObj: cObj, onTap: () {});
                  },
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ViewAllTitleRow(
                  title: "Popular Restaurants",
                  onView: () {},
                ),
              ),
                  ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: popArr.length,
                itemBuilder: (context, index) {
                  var pObj = popArr[index] as Map? ?? {};
                  return PopularRestaurantRow(pObj: pObj, onTap: () {});
                },
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ViewAllTitleRow(
                  title: "Most Popular",
                  onView: () {},
                ),
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: mostPopArr.length,
                  itemBuilder: (context, index) {
                    var mObj = mostPopArr[index] as Map? ?? {};
                    return MostPopularCell(mObj: mObj, onTap: () {});
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ViewAllTitleRow(
                  title: "Most Recents",
                  onView: () {},
                ),
              ),
              // Removing Expanded and using Flexible
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: recentArr.length,
                itemBuilder: (context, index) {
                  var rObj = recentArr[index] as Map? ?? {};
                  return RecentItemRow(rObj: rObj, onTap: () {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
