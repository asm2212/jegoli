import 'package:flutter/material.dart';
import 'package:jegoli/co_widget/popular_restaurant_row.dart';
import 'package:jegoli/co_widget/round_button.dart';
import 'package:jegoli/common/color_extension.dart';

class OfferScreen extends StatefulWidget {
  const OfferScreen({super.key});

  @override
  State<OfferScreen> createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  TextEditingController searchController = TextEditingController();

  List offerArr = [
    {
      "image": "assets/images/offer_1.png",
      "name": "Special Fizza",
      "rate": "4.9",
      "rating": "124",
      "type": "cafe",
      "food_type": "Western Food"
    },
    {
      "image": "assets/images/offer_2.png",
      "name": "Cafe De Noir",
      "rate": "4.9",
      "rating": "124",
      "type": "cafe",
      "food_type": "Western Food"
    },
    {
      "image": "assets/images/offer_3.png",
      "name": "Bakes by Tella",
      "rate": "4.9",
      "rating": "124",
      "type": "cafe",
      "food_type": "Western Food"
    },
    {
      "image": "assets/images/offer_1.png",
      "name": "Special Fizza",
      "rate": "4.9",
      "rating": "124",
      "type": "cafe",
      "food_type": "Western Food"
    },
    {
      "image": "assets/images/offer_2.png",
      "name": "Cafe De Noir",
      "rate": "4.9",
      "rating": "124",
      "type": "cafe",
      "food_type": "Western Food"
    },
    {
      "image": "assets/images/offer_3.png",
      "name": "Bakes by Tella",
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 45),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Latest Offers",
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
       
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Find discounts, Offers, special\nmeals and more!",
                      style: TextStyle(
                        color: ColorExtension.secondaryText,
                        fontSize: 14,
                        fontWeight: FontWeight.w500
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: 140,
                  height: 30,
                  child: RoundButton(onPressed: (){},
                  fontSize: 12,
                  title: "check Offers"),
                ),
                ),
               const SizedBox(height: 20,),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                itemCount: offerArr.length, // Updated here
                itemBuilder: (context, index) {
                  var pObj = offerArr[index] as Map? ?? {}; // Updated here
                  return PopularRestaurantRow(pObj: pObj, onTap: () {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
