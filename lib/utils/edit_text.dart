
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'dimens.dart';

Widget textField(BuildContext context, TextEditingController controller,
    String hint, String suffixIcon, VoidCallback suffixAction) {
  ThemeData themeData = Theme.of(context);
  return Container(
      height: dp50,
      margin: EdgeInsets.all(10),
      child: TextField(
        controller: controller,
        style: TextStyle(color: themeData.primaryColorDark),
        maxLines: 1,
        obscureText: suffixIcon != null,
        decoration: InputDecoration(
            filled: true,
            isDense: true,
            fillColor: themeData.primaryColor,
            hintText: hint,
            hintStyle: TextStyle(color: themeData.primaryColorDark),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(dp10))),
            suffixIcon: suffixIcon == null
                ? Container(
              width: dp0,
            )
                : buildTextFieldIcon(
                suffixIcon, suffixAction, themeData.disabledColor)),
      ));
}

Widget textFieldBordered(
    BuildContext context, TextEditingController controller, String hint) {
  ThemeData themeData = Theme.of(context);
  return Container(
      height: 50,
      margin: EdgeInsets.all(10),
      child: TextField(
        controller: controller,
        style: TextStyle(color: themeData.primaryColorDark),
        maxLines: 1,
        decoration: InputDecoration(
          filled: true,
          isDense: true,
          fillColor: themeData.primaryColor,
          hintText: hint,
          hintStyle: themeData.textTheme.subtitle2,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(dp10))),
        ),
      ));
}

Widget buildTextFieldIcon(String iconPath, VoidCallback action, Color color) {
  return InkWell(
    onTap: action,
    child: Padding(
        padding: EdgeInsets.all(dp10),
        child: SvgPicture.asset(
          iconPath,
          color: color,
          width: dp20,
          height: dp20,
        )),
  );
}