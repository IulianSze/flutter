// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers, unused_import

import 'package:fitness_app/pages/basic_user/videos.dart';
import 'package:fitness_app/pages/coachpage.dart';
import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'package:get/get.dart';
import'package:fitness_app/pages/basic_user/userpage.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:fitness_app/pages/basic_user/addfood.dart';
import 'package:fitness_app/pages/basic_user/calendar_for_history.dart';
import 'package:fitness_app/pages/basic_user/settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
     debugShowCheckedModeBanner: false,
     title: 'Fitness App',
     home: BottomNavBar(),
      ); 
}
}

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    List<Widget> _buildScreens() {
        return [
          UserPage(),
          AddFood(),
          Calendar(),
          UserSettings()
        ];
    }
    List<PersistentBottomNavBarItem> _navBarsItems() {
        return [
            PersistentBottomNavBarItem(
                icon: Icon(CupertinoIcons.home),
                title: ("Home"),
                activeColorPrimary: CupertinoColors.black,
                inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
            PersistentBottomNavBarItem(
                icon: Icon(CupertinoIcons.add,
                //color: Colors.black
                ),
                title: ("Add meal"),
                activeColorPrimary: CupertinoColors.black,
                inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
            PersistentBottomNavBarItem(
                icon: Icon(CupertinoIcons.archivebox),
                title: ("Meal history"),
                activeColorPrimary: CupertinoColors.black,
                inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
            PersistentBottomNavBarItem(
                icon: Icon(CupertinoIcons.settings),
                title: ("Settings"),
                activeColorPrimary: CupertinoColors.black,
                inactiveColorPrimary: CupertinoColors.systemGrey,
            ),
        ];
    }
    PersistentTabController _controller;

    _controller = PersistentTabController(initialIndex: 0);
    return PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        backgroundColor: Colors.white,
        handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true, 
        stateManagement: true,
        hideNavigationBarWhenKeyboardShows: true,
        decoration: NavBarDecoration(
          borderRadius: BorderRadius.circular(10.0),
          colorBehindNavBar: Colors.white,
        ),
        popAllScreensOnTapOfSelectedTab: true,
        popActionScreens: PopActionScreensType.all,
        itemAnimationProperties: ItemAnimationProperties(
          duration: Duration(milliseconds: 200),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: 200),
        ),
        navBarStyle: NavBarStyle.style6,
    );
  }
}
  

