import 'dart:math';

import 'package:flutter/material.dart';

const pureWhite = Color(0xFFFFFFFF);
const white = Color(0xffFBFAFA); // very light
const white1 = Color.fromARGB(255, 247, 245, 245); // soft white
const white2 = Color.fromARGB(255, 240, 238, 238); // light grey-white
const white3 = Color.fromARGB(255, 230, 228, 228); // more noticeable contrast

const grey0 = Color(0xffF5F6F7);
const grey1 = Color.fromARGB(255, 209, 211, 211);
const bgColor = Color(0xFFC1C3C5);
const grey2 = Color(0xffEDEEF0);
const grey2_5 = Color(0xFFB0B3B7);
const grey3 = Color(0xff727677);
const grey4 = Color(0xff5f6364);
const grey5 = Color(0xff414D55);
const grey6 = Color(0xff404345);
const grey7 = Color(0xff262626);

const primary = Color(0xFFEFF1F6);
const primary2 = Color(0xFFE9E6ED);
const primary3 = Color(0xFFF4F6FB);

const textColor = Color(0xFF2D2D2D);
const textColor1 = Color(0xFF5D3A9B);
const textColor2 = Color(0xFF1E1F4B);
const headingColor = Color(0xFF3B3B70);

const rootHeaderBackgroundColor = Color(0xFFE9E6ED);

const Color webColor = Color.fromRGBO(215, 212, 253, 1.0);
const Color slightlyDarkerWebColor = Color.fromRGBO(225, 223, 245, 1.0);
const Color ButtonColor = Color.fromARGB(255, 56, 93, 216);
const Color ButtonColor2 = Color.fromARGB(255, 112, 110, 238);

const Color ButtonColor3 = Color.fromARGB(255, 59, 57, 221);

const black = Color.fromRGBO(0, 0, 0, 1);
const black1 = Color(0xFF1C1C1E);
const black2 = Colors.black45;
const cardColor = Color(0xff171616);
const orderNowColor = Color(0xFFE53935);

// //greens

//const iconColor = Color.fromRGBO(114, 118, 119, 1);

//purple & pink
// const purple = Color(0xff423246);
// const purple1 = Color(0xff9F1EBF);
// const pink = Color(0xffE737B6);

//yellow
// const yellow = Color(0xffE89B3F);
// const yellow1 = Color(0xffEEDA26);

// const orange = Color(0xffDC6F20);
// const brown = Color(0xffA77120);
 const transparent = Colors.transparent;
// const lightYellow = Color(0xffFFF9EF);
// const lightRed = Color(0xffFEF0F0);

//whites

// //blues
// const blue = Color(0xff10ADCF);
// const blue2 = Color(0xff1949CA);
 const indigo = Color(0xff280E91);

// //greys

const green1 = Color(0xff12B799);
const green2 = Color(0xff116F7B);
const green3 = Color(0xff135C7B);
const green4 = Color(0xff26B84F);

// // Teal shades
const teal = Color(0xff009688);
const tealLight = Color(0xff80CBC4);
const tealDark = Color(0xff004D40);
const tealLighter = Color(0xffB2DFDB); // Softer, lighter teal
const tealExtraLight = Color(0xFFE0F2F1); // Very light teal
const tealUltraLight = Color(0xFFF1F8F7);

// // Cyan shades
const cyan = Color(0xff00BCD4);
const cyanLight = Color(0xffB2EBF2);
const Color cyanExtraLight = Color.fromRGBO(235, 250, 249, 1.0);

const cyanDark = Color(0xff00838F);

// // Additional purples
const deepPurple = Color(0xff673AB7);
const lavender = Color(0xffE1BEE7);
const midnightBlue = Color(0xff191970);

// Earthy tones
const olive = Color(0xff808000);
const khaki = Color(0xffF0E68C);

String colorToHex(Color color) {
  return '#${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}';
}

Color hexToColor(String hex) {
  final buffer = StringBuffer();
  if (hex.isEmpty) {
    return primary; // Default color, can be any color you prefer
  }
  if (hex.length == 6 || hex.length == 7) buffer.write('FF');
  buffer.write(hex.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}

String generateRandomHexColor(BuildContext context) {
  // Define a fixed set of solid colors that are visually appealing.
  List<String> solidColors = [
    '#FF0000', // Red
    '#0000FF', // Blue
    '#800080', // Purple
    '#FFA500', // Orange
    '#000000', // Black
  ];

  // Pick a random color from the predefined list.
  Random random = Random();
  String selectedColor = solidColors[random.nextInt(solidColors.length)];

  return selectedColor;
}
