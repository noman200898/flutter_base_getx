import 'package:base_application/ui/second_page.dart';
import 'package:base_application/utils/constants.dart';
import 'package:base_application/utils/custom_buttons.dart';
import 'package:base_application/utils/dimens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController _controller = Get.find();

  void _incrementCounter() {
    _controller.counter.value++;
    Get.snackbar("Wow", "I am adding new 1",
        snackPosition: SnackPosition.BOTTOM, duration: Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: Theme.of(context).textTheme.headline2),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              AssetConstants.img_banner_demo,
              width: dp150,
              height: dp150,
            ),
            Text('You have pushed the button this many times:'.tr,
            ),
            Obx(() => Text(
                  "${_controller.counter.value}",
                  style: Theme.of(context).textTheme.headline2,
                )),
            buttonRoundedWithIcon(context, "Go".tr, AssetConstants.ic_settings, () {
              Get.to(() => SecondPage());
            }),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
