import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:furniture_web/utlis/constants/theme/app_palette.dart';

class ThemeHelper {
  static Color getBorderColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? white.withOpacity(0.5)
        : const Color.fromRGBO(114, 118, 119, 1);
  }

  static Color getTabbarBorderColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark ? black1 : grey1;
  }

  static Color getBackGroundColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark ? black : grey0;
  }

  static Color getBlackWhite(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark ? black : pureWhite;
  }

  static Color getWhiteBlack(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark ? white : black;
  }

  static Color getTextFieldBackGroundColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark ? cardColor : grey2;
  }

  static Color getTrailingIconColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark ? white : black2;
  }

  static Color getFieldColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark ? black1 : pureWhite;
  }

  static Color getFieldBorderColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark ? cardColor : grey1;
  }

  static Color getCardColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark ? cardColor : white1;
  }

  static Color getTabbarTextColor(BuildContext context, bool isOpposite) {
    return Theme.of(context).brightness == Brightness.dark && !isOpposite
        ? white
        : isOpposite
        ? white
        : cardColor;
  }

  static bool isDarkMode(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark;
  }

  static Color getWidgetColor(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark
        ? cardColor
        : const Color.fromARGB(255, 236, 236, 236);
  }

  Future<Uint8List> loadImageAsUint8List(String assetPath) async {
    ByteData data = await rootBundle.load(assetPath);
    List<int> bytes = data.buffer.asUint8List();
    return Uint8List.fromList(bytes);
  }
}
