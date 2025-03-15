import 'package:flutter/material.dart';
import 'package:islami_app/constant.dart';

abstract class AppStyles {
  static TextStyle styleBold16(BuildContext context) {
    return TextStyle(
      color: kPrimaryolor,
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontFamily: 'Janna LT',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleBold20(BuildContext context) {
    return TextStyle(
      color: const Color(0xFF202020),
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontFamily: 'Janna LT',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleBold24(BuildContext context) {
    return TextStyle(
      color: kPrimaryolor,
      fontSize: getResponsiveFontSize(context, fontSize: 24),
      fontFamily: 'Janna LT',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleBold36(BuildContext context) {
    return TextStyle(
      color: const Color(0xFFFFFFFF),
      fontSize: getResponsiveFontSize(context, fontSize: 36),
      fontFamily: 'Janna LT',
      fontWeight: FontWeight.w700,
    );
  }
}

// sacleFactor
// responsive font size
// (min , max) fontsize
double getResponsiveFontSize(context, {required double fontSize}) {
  double scaleFactor = getScaleFactor(context);
  double responsiveFontSize = fontSize * scaleFactor;

  double lowerLimit = fontSize * .8;
  double upperLimit = fontSize * 1.2;

  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getScaleFactor(context) {
  // var dispatcher = PlatformDispatcher.instance;
  // var physicalWidth = dispatcher.views.first.physicalSize.width;
  // var devicePixelRatio = dispatcher.views.first.devicePixelRatio;
  // double width = physicalWidth / devicePixelRatio;

  double width = MediaQuery.sizeOf(context).width;
  if (width < 600) {
    return width / 400;
  } else if (width < 1000) {
    return width / 700;
  } else {
    return width / 1000;
  }
}
