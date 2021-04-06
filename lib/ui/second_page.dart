import 'package:base_application/utils/app_theme.dart';
import 'package:base_application/utils/constants.dart';
import 'package:base_application/utils/custom_buttons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SecondPage extends StatefulWidget {
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final appdata = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Second page".tr,
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buttonRounded(
              context,
              "Show".tr,
              showDialog,
            ),
            buttonOutline(context, "Change Theme".tr, "", true, () {
              bool isDarkMode = appdata.read(PreferenceKey.darkMode);
              appdata.write(PreferenceKey.darkMode, !isDarkMode);
              Get.changeTheme(
                  isDarkMode ? AppThemes().lightTheme : AppThemes().darkTheme);
            }),
            buttonText(
              context,
              "Change language".tr,
              () {
                bool isBengali = appdata.read(PreferenceKey.languageBengali);
                appdata.write(PreferenceKey.languageBengali, !isBengali);
                var locale =
                    isBengali ? Locale('en', 'US') : Locale('bn', 'BD');
                Get.updateLocale(locale);
              },
            )
          ],
        ),
      ),
    );
  }

  void showDialog() {
    Get.defaultDialog(
        title: "Dialog showing",
        middleText: "This is get default dialog view",
        textCancel: "Cancel",
        textConfirm: "Ok",
        titleStyle: Get.theme.textTheme.headline2,
        middleTextStyle: Get.theme.textTheme.headline2,
        backgroundColor: Get.theme.primaryColor);
  }
}
