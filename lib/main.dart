import 'package:base_application/ui/bottom_navigation/bottom_bar_page.dart';
import 'package:base_application/ui/home/home_controller.dart';
import 'package:base_application/utils/app_theme.dart';
import 'package:base_application/utils/constants.dart';
import 'package:base_application/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  Get.put(HomeController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final appdata = GetStorage();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    appdata.writeIfNull(PreferenceKey.darkMode, false);
    appdata.writeIfNull(PreferenceKey.languageBengali, false);

    bool isDarkMode = appdata.read(PreferenceKey.darkMode);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.rightToLeft,
      theme: isDarkMode ? AppThemes().darkTheme : AppThemes().lightTheme,
      translations: Strings(),
      locale: Locale("bn", "BD"),
      fallbackLocale: Locale("en", "US"),
      initialRoute: "/",
      home: BottomBarPage(),
    );
  }
}
