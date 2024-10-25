import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:jegoli/co_widget/round_icon_button.dart';
import 'package:jegoli/common/color_extension.dart';
import 'package:jegoli/screens/more/my_order_screen.dart';

class ItemDetailsScreen extends StatefulWidget {
  const ItemDetailsScreen({super.key});

  @override
  State<ItemDetailsScreen> createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
  double price = 15;
  int qty = 1;
  bool isFav = false;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorExtension.white,
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset(
            "assets/images/detail_top.png",
            height: media.width,
            width: media.width,
            fit: BoxFit.cover,
          ),
          Container(
            width: media.width,
            height: media.height,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.black26,
                  Color.fromARGB(0, 38, 36, 36),
                  Color(0xffffffff),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: media.width - 60,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: ColorExtension.white,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 35,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 26),
                              child: Text(
                                "Special chicken pizza",
                                style: TextStyle(
                                  color: ColorExtension.primaryText,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      IgnorePointer(
                                        ignoring: true,
                                        child: RatingBar.builder(
                                            initialRating: 4,
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemSize: 22,
                                            itemPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 2),
                                            itemBuilder: (context, _) => Icon(
                                                  Icons.star,
                                                  color: ColorExtension.primary,
                                                ),
                                            onRatingUpdate: (rating) {
                                              print(rating);
                                            }),
                                      ),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      Text(
                                        "4 Star Ratings",
                                        style: TextStyle(
                                            color: ColorExtension.primary,
                                            fontSize: 11,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "\$${price.toStringAsFixed(2)}",
                                        style: TextStyle(
                                            color: ColorExtension.primaryText,
                                            fontSize: 31,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      const SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        "/ per Portion",
                                        style: TextStyle(
                                            color: ColorExtension.primaryText,
                                            fontSize: 11,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 26),
                                child: Text(
                                  "Description",
                                  style: TextStyle(
                                    color: ColorExtension.primaryText,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  ),
                                )),
                            const SizedBox(
                              height: 6,
                            ),
                            Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 26),
                                child: Text(
                                  "A delicious pizza topped with tender tandoori chicken, fresh vegetables, and a perfect blend of spices. Perfect for a single serving or group dining.",
                                  style: TextStyle(
                                    color: ColorExtension.secondaryText,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )),
                            const SizedBox(
                              height: 12,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 25),
                              child: Divider(
                                color: ColorExtension.secondaryText
                                    .withOpacity(0.14),
                                height: 1,
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 26),
                              child: Text("Customize your Order ",
                                  style: TextStyle(
                                    color: ColorExtension.primaryText,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                  )),
                            ),
                            const SizedBox(height: 20),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 26),
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: ColorExtension.textfield,
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                      isExpanded: true,
                                      items: ["small", "big"].map((e) {
                                        return DropdownMenuItem(
                                          value: e,
                                          child: Text(
                                            e,
                                            style: TextStyle(
                                              color: ColorExtension.primaryText,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (val) {},
                                      hint: Text(
                                        "- Select the size of portion -",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: ColorExtension.secondaryText,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 26),
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: ColorExtension.textfield,
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                      isExpanded: true,
                                      items: ["small", "big"].map((e) {
                                        return DropdownMenuItem(
                                          value: e,
                                          child: Text(
                                           e,
                                            style: TextStyle(
                                              color: ColorExtension.primaryText,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                      onChanged: (val) {},
                                      hint: Text(
                                        "- Select the ingredients -",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: ColorExtension.secondaryText,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 15),
                              child: Row(
                                children: [
                                  Text(
                                    "Number of Portions",
                                    style: TextStyle(
                                        color: ColorExtension.primaryText,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  const Spacer(),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        qty = qty - 1;
                                        if (qty < 1) qty = 1;
                                      });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: ColorExtension.primary,
                                          borderRadius:
                                              BorderRadius.circular(12.5)),
                                      child: Text(
                                        "-",
                                        style: TextStyle(
                                          color: ColorExtension.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                          color: ColorExtension.primary,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(12.5)),
                                    child: Text(
                                      qty.toString(),
                                      style: TextStyle(
                                        color: ColorExtension.primary,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 6,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      qty = qty + 1;
                                      setState(() {});
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: ColorExtension.primary,
                                          borderRadius:
                                              BorderRadius.circular(12.5)),
                                      child: Text(
                                        "+",
                                        style: TextStyle(
                                          color: ColorExtension.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              height: 220,
                              child: Stack(
                                alignment: Alignment.centerLeft,
                                children: [
                                  Container(
                                    // margin: const EdgeInsets.only(top: 180),
                                    width: media.width * 0.27,
                                    height: 150,
                                    decoration: BoxDecoration(
                                      color: ColorExtension.primary,
                                      borderRadius: const BorderRadius.only(
                                          topRight: Radius.circular(35),
                                          bottomRight: Radius.circular(35)),
                                    ),
                                  ),
                                  Center(
                                    child: Stack(
                                      alignment: Alignment.centerRight,
                                      children: [
                                        Container(
                                          margin: const EdgeInsets.only(
                                              top: 8,
                                              bottom: 8,
                                              left: 12,
                                              right: 20),
                                          width: media.width - 100,
                                          height: 110,
                                          decoration: const BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(35),
                                                  bottomLeft:
                                                      Radius.circular(35),
                                                  topRight: Radius.circular(10),
                                                  bottomRight:
                                                      Radius.circular(10)),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black12,
                                                    blurRadius: 8,
                                                    offset: Offset(0, 4))
                                              ]),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Total Price",
                                                style: TextStyle(
                                                  color: ColorExtension
                                                      .primaryText,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 8,
                                              ),
                                              Text(
                                                "\$${(price * qty).toString()}",
                                                style: TextStyle(
                                                    color: ColorExtension
                                                        .primaryText,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              SizedBox(
                                                width: 130,
                                                height: 25,
                                                child: RoundIconButton(
                                                    title: "Add to Cart",
                                                    icon:
                                                        "assets/images/shopping_add.png",
                                                    color:
                                                        ColorExtension.primary,
                                                    onPressed: () {}),
                                              ),
                                            ],
                                          ),
                                        ),
                                        InkWell(
                                          onTap: (){
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => const MyOrderScreen()));
                                          },
                                          child: Container(
                                            width: 45,
                                            height: 45,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(21.5),
                                                boxShadow: const [
                                                  BoxShadow(
                                                      color: Colors.black12,
                                                      blurRadius: 4,
                                                      offset: Offset(0, 1))
                                                ]),
                                            alignment: Alignment.center,
                                            child: Image.asset(
                                              "assets/images/shopping_cart.png",
                                              width: 15,
                                              height: 15,
                                              color: ColorExtension.primary,
                                            ),
                                          ),
                                        )
                                        // Row(

                                        //   crossAxisAlignment: CrossAxisAlignment.center,
                                        //   children: [

                                        //   ],
                                        // )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                  Container(
                    height: media.width - 20,
                    alignment: Alignment.bottomRight,
                    margin: const EdgeInsets.only(right: 4),
                    child: InkWell(
                      onTap: () {
                        isFav = !isFav;
                        setState(() {});
                      },
                      child: Image.asset(
                        isFav
                            ? "assets/images/favorites_btn.png"
                            : "assets/images/favorites_btn_2.png",
                        width: 70,
                        height: 70,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
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
                          color: ColorExtension.white,
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          "assets/images/shopping_cart.png",
                          width: 25,
                          height: 25,
                          color: ColorExtension.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
