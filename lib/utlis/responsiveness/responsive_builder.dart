// import 'package:flutter/material.dart';
// import 'package:furniture_web/utlis/responsiveness/responsive.dart';
// /// Cleaner alternative to `Responsive` class using builder-style
// class ResponsiveBuilder extends StatelessWidget {
//   final Widget mobile;
//   final Widget? tablet;
//   final Widget desktop;

//   const ResponsiveBuilder({
//     super.key,
//     required this.mobile,
//     this.tablet,
//     required this.desktop,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final screenType = Responsive.getScreenType(context);

//     switch (screenType) {
//       case ScreenType.mobile:
//         return mobile;
//       case ScreenType.tablet:
//         return tablet ?? desktop;
//       case ScreenType.desktop:
//         return desktop;
//     }
//   }
// }
