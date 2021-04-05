import 'package:flutter/cupertino.dart';

import 'dimens.dart';

final splashBackgroundDecoration = BoxDecoration(
  image: DecorationImage(
    image: AssetImage(
      "",
    ),
    fit: BoxFit.cover,
  ),
);

final registrationBackgroundDecoration = BoxDecoration(
  image: DecorationImage(
    image: AssetImage(
      "",
    ),
    fit: BoxFit.cover,
  ),
);

getRoundedCornerShape({double borderRadius = dp20}) {
  return RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
  );
}
