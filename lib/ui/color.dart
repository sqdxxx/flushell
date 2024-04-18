
import 'package:flutter/material.dart';

class ColorUtil {

  final Color backgroundBlack = Color(0xFF272625);
  final Color backgroundBlack40 = Color(0xFF404040);
  final Color backgroundBlack50 = Color(0xFF505050);
  final Color backgroundBlack70 = Color(0xFF707070);
  final Color backgroundBlack90 = Color(0xFF909090);
  final Color backgroundBlacka0 = Color(0xFFa0a0a0);

  final Color backgroundFFFWhite = Color(0xFFFFFFFF);
  final Color backgroundWhite = Color(0xFFFAFAFA);
  final Color backgroundDarkWhite = Color(0xFFF4F3F2);
  final Color backgroundLightWhite = Color(0xFFF9F9F9);
  final Color backgroundGrays = Color(0xFFE8E8E5);
  final Color backgroundGray = Color(0xFFBFBFBF);
  final Color backgroundLightGray = Color(0xFFF5F4F2);
  final Color backgroundOrangeDisable = Color(0xFFFFDD9A);
  final Color backgroundOrangeLight = Color(0xFFFFF1CC);
  final Color backgroundOrangeNormal = Color(0xFFFFC933);
  final Color textBlack = Color(0xFF272625);
  final Color text333 = Color(0xFF333333);
  final Color text222 = Color(0xFF222222);
  final Color text666 = Color(0xFF666666);
  final Color text999 = Color(0xFF999999);
  final Color textGray = Color(0xFFBFBFBF);
  final Color textDeepGray = Color(0xFF73726F);
  final Color textWhite = Color(0xFFFFFFFF);
  final Color textBlue = Color(0xFF528BFF);
  final Color textRed = Color(0xFFFF5252);
  final Color borderBlack = Color(0xFF272625);
  final Color link = Color(0xFF126CF3);

  /// 创建一个新的 Color 实例，通过指定 RGB 值的整数表示。
  // static Color fromRGB(int red, int green, int blue) {
  //   assert(red >= 0 && red <= 255);
  //   assert(green >= 0 && green <= 255);
  //   assert(blue >= 0 && blue <= 255);
  //   return Color.fromARGB(255, red, green, blue);
  // }

  /// 创建一个新的 Color 实例，通过指定十六进制字符串表示。
  Color hex(String hexColor) {
    final hexCode = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }
}