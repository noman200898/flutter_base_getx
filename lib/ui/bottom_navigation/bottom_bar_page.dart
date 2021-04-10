import 'package:base_application/ui/home/home_page.dart';
import 'package:base_application/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../second_page.dart';
import 'bottom_bar_controller.dart';

class BottomBarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<BottomBarController>(
        init: BottomBarController(),
        builder: (s) => IndexedStack(
          index: s.selectedIndex,
          children: <Widget>[
            HomePage(title: 'Home Page'.tr),
            SecondPage(),
          ],
        ),
      ),
      bottomNavigationBar: BaseBottomNavigationBar(),
    );
  }
}

class BaseBottomNavigationBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BottomBarController>(
      builder: (s) => BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          setNavigationItem(AssetConstants.ic_profile, context),
          setNavigationItem(AssetConstants.ic_settings, context),
        ],
        currentIndex: s.selectedIndex,
        onTap: (index) => s.onItemTapped(index),
      ),
    );
  }

  BottomNavigationBarItem setNavigationItem(
      String iconPath, BuildContext context) {
    return BottomNavigationBarItem(
        icon: SvgPicture.asset(
          iconPath,
          color: Get.isDarkMode ? Colors.white : Get.theme.primaryColorDark,
        ),
        activeIcon: SvgPicture.asset(
          iconPath,
          color: Get.theme.accentColor,
        ),
        label: "");
  }
}
