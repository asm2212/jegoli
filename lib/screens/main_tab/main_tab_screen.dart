import 'package:flutter/material.dart';
import 'package:jegoli/co_widget/tab_button.dart';
import 'package:jegoli/common/color_extension.dart';
import 'package:jegoli/screens/home/home_screen.dart';
import 'package:jegoli/screens/menu/menu_screen.dart';
import 'package:jegoli/screens/offer/offer_screen.dart';
import 'package:jegoli/screens/profile/profile_screen.dart';

class MainTabScreen extends StatefulWidget {
  const MainTabScreen({super.key});

  @override
  State<MainTabScreen> createState() => _MainTabScreenState();
}

class _MainTabScreenState extends State<MainTabScreen> {
  int selectTab = 2;
  PageStorageBucket storageBucket = PageStorageBucket();
  Widget selectPageView = const HomeScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(bucket: storageBucket, child: selectPageView),
      // backgroundColor: const Color(0xfff5f5f5),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: SizedBox(
        width: 60,
        height: 60,
        child: FloatingActionButton(
          onPressed: (){
            if(selectTab != 2){
              selectTab = 2;
              selectPageView = const HomeScreen();
            }if(mounted){
              setState(() {});
            }
          },
          shape: const CircleBorder(),
          backgroundColor: selectTab == 2 ? ColorExtension.primary : ColorExtension.placeholder,
          child: Image.asset(
            "assets/images/tab_home.png",
            width: 30,
            height: 30,
          ),
          ),
      ),
      bottomNavigationBar: BottomAppBar(
        shadowColor: Colors.black,
        surfaceTintColor: ColorExtension.white,
        elevation: 1,
        notchMargin: 12,
        height: 64,
        shape: const CircularNotchedRectangle(),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
            TabButton(
              onTap: (){
                if(selectTab != 0){
                  selectTab = 0;
                  selectPageView = const MenuScreen();
                }if(mounted){
                  setState(() {});
            }
              },
               title: "Menu", 
               isSelected: selectTab == 0, 
               icon: "assets/images/tab_menu.png",
               ),
          
                TabButton(
              onTap: (){
                if(selectTab != 1){
                  selectTab = 1;
                  selectPageView = const OfferScreen();
                }if(mounted){
                  setState(() {});
            }
              },
               title: "Offer", 
               isSelected: selectTab == 1, 
               icon: "assets/images/tab_offer.png",
               ),
          
               const SizedBox(width: 40, height: 40,),
          
                TabButton(
              onTap: (){
                if(selectTab != 3){
                  selectTab = 3;
                  selectPageView = const ProfileScreen();
                }if(mounted){
                  setState(() {});
            }
              },
               title: "Profile", 
               isSelected: selectTab == 3, 
               icon: "assets/images/tab_profile.png",
               ),
          
                TabButton(
              onTap: (){
                if(selectTab != 4){
                  selectTab = 4;
                  selectPageView = Container();
                }if(mounted){
                  setState(() {});
            }
              },
               title: "More", 
               isSelected: selectTab == 4, 
               icon: "assets/images/tab_more.png",
               ),
            ],
          ),
        ),
      ),
    );
  }
}