import 'package:flutter/material.dart';
import 'package:social_app/core/utils/constants.dart';
import 'package:social_app/core/utils/size_config.dart';

abstract class Styles {
  static double getResponsiveFontSize(
    BuildContext context, {
    required double fontSize,
  }) {
    final double scaleFactor = getScaleFactor(context);
    final double responsiveFontSize = fontSize * scaleFactor;

    final double lowerLimit = fontSize * 0.8;
    final double upperLimit = fontSize * 1.2;
    return responsiveFontSize.clamp(lowerLimit, upperLimit);
  }

  static double getScaleFactor(BuildContext context) {
    // You can use mediaquery but it will be a pain in the a**.
    // because you will need to convert all the styles to functions to access the context.

    final double width = MediaQuery.sizeOf(context).width;

    // or You can use this way but you will have to do a hot restart to see the results.

    // var dispatcher = PlatformDispatcher.instance;
    // var physicalWidth = dispatcher.views.first.physicalSize.width;
    // var devicePixelRatio = dispatcher.views.first.devicePixelRatio;
    // double width = physicalWidth / devicePixelRatio;

    if (width <= SizeConfig.tabletBreakpoint) {
      return width / 550;
    } else if (width <= SizeConfig.desktopBreakpoint) {
      return width / 1000;
    } else {
      return width / 1920;
    }
  }

  static TextStyle styleMedium12(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontWeight: FontWeight.w500,
      color: Colors.white,
      fontFamily: kCairoFamily,
    );
  }

  static TextStyle styleBold12(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontFamily: kCairoFamily,
    );
  }

  static TextStyle styleSemiBold12(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontWeight: FontWeight.w600,
      color: Colors.white,
      fontFamily: kCairoFamily,
    );
  }

  static TextStyle styleRegular12(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontWeight: FontWeight.normal,
      color: Colors.white,
      fontFamily: kCairoFamily,
    );
  }

  static TextStyle styleMedium14(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontWeight: FontWeight.w500,
      color: Colors.white,
      fontFamily: kCairoFamily,
    );
  }

  static TextStyle styleBold14(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontFamily: kCairoFamily,
    );
  }

  static TextStyle styleSemiBold14(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontWeight: FontWeight.w600,
      color: Colors.white,
      fontFamily: kCairoFamily,
    );
  }

  static TextStyle styleRegular14(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontWeight: FontWeight.normal,
      color: Colors.white,
      fontFamily: kCairoFamily,
    );
  }

  static TextStyle styleMedium16(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontWeight: FontWeight.w500,
      color: Colors.white,
      fontFamily: kCairoFamily,
    );
  }

  static TextStyle styleBold16(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontFamily: kCairoFamily,
    );
  }

  static TextStyle styleSemiBold16(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontWeight: FontWeight.w600,
      color: Colors.white,
      fontFamily: kCairoFamily,
    );
  }

  static TextStyle styleRegular16(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontWeight: FontWeight.normal,
      color: Colors.white,
      fontFamily: kCairoFamily,
    );
  }

  static TextStyle styleMedium18(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      fontWeight: FontWeight.w500,
      color: Colors.white,
      fontFamily: kCairoFamily,
    );
  }

  static TextStyle styleBold18(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontFamily: kCairoFamily,
    );
  }

  static TextStyle styleSemiBold18(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      fontWeight: FontWeight.w600,
      color: Colors.white,
      fontFamily: kCairoFamily,
    );
  }

  static TextStyle styleRegular18(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 18),
      fontWeight: FontWeight.normal,
      color: Colors.white,
      fontFamily: kCairoFamily,
    );
  }

  static TextStyle styleMedium20(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontWeight: FontWeight.w500,
      color: Colors.white,
      fontFamily: kCairoFamily,
    );
  }

  static TextStyle styleBold20(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontFamily: kCairoFamily,
    );
  }

  static TextStyle styleSemiBold20(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontWeight: FontWeight.w600,
      color: Colors.white,
      fontFamily: kCairoFamily,
    );
  }

  static TextStyle styleRegular20(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontWeight: FontWeight.normal,
      color: Colors.white,
      fontFamily: kCairoFamily,
    );
  }

  static TextStyle styleMedium22(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 22),
      fontWeight: FontWeight.w500,
      color: Colors.white,
      fontFamily: kCairoFamily,
    );
  }

  static TextStyle styleBold22(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 22),
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontFamily: kCairoFamily,
    );
  }

  static TextStyle styleSemiBold22(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 22),
      fontWeight: FontWeight.w600,
      color: Colors.white,
      fontFamily: kCairoFamily,
    );
  }

  static TextStyle styleRegular22(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 22),
      fontWeight: FontWeight.normal,
      color: Colors.white,
      fontFamily: kCairoFamily,
    );
  }

  static TextStyle styleMedium24(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 24),
      fontWeight: FontWeight.w500,
      color: Colors.white,
      fontFamily: kCairoFamily,
    );
  }

  static TextStyle styleBold24(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 24),
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontFamily: kCairoFamily,
    );
  }

  static TextStyle styleSemiBold24(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 24),
      fontWeight: FontWeight.w600,
      color: Colors.white,
      fontFamily: kCairoFamily,
    );
  }

  static TextStyle styleRegular24(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 24),
      fontWeight: FontWeight.normal,
      color: Colors.white,
      fontFamily: kCairoFamily,
    );
  }

  static TextStyle styleMedium26(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 26),
      fontWeight: FontWeight.w500,
      color: Colors.white,
      fontFamily: kCairoFamily,
    );
  }

  static TextStyle styleBold26(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 26),
      fontWeight: FontWeight.bold,
      color: Colors.white,
      fontFamily: kCairoFamily,
    );
  }

  static TextStyle styleSemiBold26(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 26),
      fontWeight: FontWeight.w600,
      color: Colors.white,
      fontFamily: kCairoFamily,
    );
  }

  static TextStyle styleRegular26(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 26),
      fontWeight: FontWeight.normal,
      color: Colors.white,
      fontFamily: kCairoFamily,
    );
  }
}
