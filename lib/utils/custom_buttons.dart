import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';
import 'dimens.dart';

Widget buttonOnlyIcon(
    BuildContext context, Icon icon, VoidCallback onPressCallback,
    {String iconPath = "", double size = dp20, bool isColorDark = false}) {
  return IconButton(
    onPressed: onPressCallback,
    icon: iconPath.isNotEmpty
        ? Image.asset(
            iconPath,
            width: size,
            height: size,
            color: isColorDark
                ? Theme.of(context).primaryColorDark
                : Theme.of(context).primaryColor,
          )
        : icon,
  );
}

Widget buttonRounded(BuildContext context, String text, VoidCallback onPressCallback, {double width = dp0}) {
  double buttonWidth = width == 0 ? Get.width : width;
  return Container(
    margin: EdgeInsets.all(10),
    height: dp50,
    width: buttonWidth,
    child:   ElevatedButton(
        child: Text(text, style: TextStyle(color: Theme.of(context).primaryColor, fontSize: dp18)
        ),
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
            backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).accentColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(dp5)),
                    side: BorderSide(color: Theme.of(context).accentColor)
                )
            )
        ),
        onPressed: onPressCallback
    )
  );
}

Widget buttonRoundedWithIcon(BuildContext context, String text, String iconPath, VoidCallback onPressCallback, {Color color = Colors.white,}) {
  return Container(
      margin: EdgeInsets.all(dp10),
      height: dp50,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton.icon(
        icon: SvgPicture.asset(
          iconPath,
          width: dp30,
          height: dp30,
        ),
        label: Text(text, style: GoogleFonts.lato(color: color, fontSize: dp20, fontWeight: FontWeight.bold),),
        onPressed: onPressCallback,
        style: ElevatedButton.styleFrom(
          primary: deep_blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ));
}

Widget buttonText(BuildContext context, String text, VoidCallback action) {
  return Container(
    margin: EdgeInsets.only(right: dp10, left: dp10),
    alignment: Alignment.center,
    child: TextButton(
      onPressed: action,
      child: Text(
        text,
        style: TextStyle(
          color: Theme.of(context).accentColor,
        ),
      ),
    ),
  );
}

Widget buttonOnlyIconWithRoundBackground(BuildContext context, String iconPath,
    bool isSelected, VoidCallback onPressCallback) {
  var theme = Theme.of(context);
  return MaterialButton(
    onPressed: onPressCallback,
    color: isSelected ? theme.accentColor : theme.primaryColor,
    height: dp30,
    child: Image.asset(
      iconPath,
      width: dp25,
      height: dp25,
    ),
    padding: EdgeInsets.all(10),
    shape: CircleBorder(),
  );
}

Widget buttonOutline(BuildContext context, String text, String iconPath,
    bool isSelected, VoidCallback onPressCallback, {double width = 0}) {
  double buttonWidth = width == 0 ? Get.width : width;
  Widget iconView = Container();
  if (iconPath != null && iconPath.isNotEmpty) {
    iconView = Padding(
      padding: EdgeInsets.all(5.0),
      child: Image.asset(
        iconPath,
        width: dp16,
        height: dp16,
        color: isSelected
            ? Theme.of(context).primaryColor
            : Theme.of(context).primaryColorDark,
      ),
    );
  }

  return Container(
    margin: EdgeInsets.all(5),
    height: dp40,
    width: buttonWidth,
    child: OutlinedButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          iconView,
          Text(
            text,
            style: GoogleFonts.lato(
                color: isSelected
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).primaryColorDark,
                fontSize: dp16),
          ),
        ],
      ),
      onPressed: onPressCallback,
      //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0),),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>((states) {
        return isSelected
            ? Theme.of(context).primaryColorDark
            : Theme.of(context).primaryColor;
      }), shape: MaterialStateProperty.resolveWith<OutlinedBorder>((_) {
        return RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(dp20));
      })),
    ),
  );
}
