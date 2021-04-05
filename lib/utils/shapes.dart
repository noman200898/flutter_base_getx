import 'package:flutter/material.dart';

import 'dimens.dart';

getTopCurve({double topLeft = dp20, double topRight = dp20}) =>
    RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(topLeft),
        topRight: Radius.circular(topRight),
      ),
    );

getAllCurve({double top = dp20, double bottom = dp20}) =>
    RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(top),
        topRight: Radius.circular(top),
        bottomLeft: Radius.circular(bottom),
        bottomRight: Radius.circular(bottom),
      ),
    );