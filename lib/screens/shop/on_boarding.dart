import 'package:flutter/material.dart';
import 'package:jegoli/co_widget/round_button.dart';
import 'package:jegoli/common/color_extension.dart';
import 'package:jegoli/screens/main_tab/main_tab_screen.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {   
  int selectPage = 0;
  PageController controller = PageController();
  List pageArr = [
    {
      "title": "Find Food You Love",
      "subtitle": "Discover local restaurants, cafes, and bars near you.",
      "image": "assets/images/on_boarding_1.png",
    },
    {
      "title": "Fast Delivery",
      "subtitle": "Order food quickly and easily through our delivery service.",
      "image": "assets/images/on_boarding_2.png",
    },
    {
      "title": "Live Tracking",
      "subtitle": "Receive real-time updates on your delivery status and location.",
      "image": "assets/images/on_boarding_3.png",
    },
  ];

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        selectPage = controller.page?.round() ?? 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          PageView.builder(
            controller: controller,
            itemCount: pageArr.length,
            itemBuilder: (context, index) {
              var pObj = pageArr[index] as Map? ?? {};
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: media.width,
                      height: media.height * 0.5,
                      alignment: Alignment.center,
                      child: Image.asset(
                        pObj['image'].toString(),
                        width: media.width * 0.56,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      height: media.width * 0.1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(pageArr.length, (index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          height: 8,
                          width: selectPage == index ? 16 : 8,
                          decoration: BoxDecoration(
                            color: selectPage == index
                                ? ColorExtension.primary
                                : ColorExtension.placeholder,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        );
                      }),
                    ),
                    SizedBox(
                      height: media.width * 0.05,
                    ),
                    
                    Text(
                      pObj["title"].toString(),
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w800,
                        color: ColorExtension.primaryText,
                      ),
                    ),
                    SizedBox(
                      height: media.width * 0.07,
                    ),
                    Text(
                      pObj["subtitle"].toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: ColorExtension.secondaryText,
                      ),
                    ),
                    SizedBox(
                      height: media.width * 0.2,
                    ),
                  ],
                ),
              );
            },
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: RoundButton(
                  onPressed: () {
                    if (selectPage >= 2){
                      Navigator.push(context,
                       MaterialPageRoute(builder: (context) => const MainTabScreen()));
                    } else {
                      setState(() {
                        selectPage = selectPage +1 ;
                        controller.animateToPage(selectPage,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut);
                      });
                    }
                  },
                  title: "Next",
                ),
              ),
              SizedBox(
                height: media.width * 0.2,
              ),
            ],
          )
        ],
      ),
    );
  }
}
