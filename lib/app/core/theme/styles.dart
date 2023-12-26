import 'package:aircharge/app/core/constants/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Styles {
  // Hero Bold
  static TextStyle heroBold({
    double? size,
    Color? color,
    FontStyle? fontStyle,
    TextDecoration? textDecoration,
    FontFamily? font = FontFamily.hero,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontFamily: font?.name,
      color: color,
      height: 1.25,
      fontSize: size?.sp,
      fontStyle: fontStyle,
      decoration: textDecoration,
    );
  }

  // Hero regular
  static TextStyle heroRegular({
    double? size,
    Color? color,
    FontStyle? fontStyle,
    TextDecoration? textDecoration,
    FontFamily? font = FontFamily.hero,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontFamily: font?.name,
      color: color,
      height: 1.25,
      fontStyle: fontStyle,
      decoration: textDecoration,
      fontSize: size?.sp,
    );
  }

  // Meta bold
  static TextStyle metaBold({
    double? size,
    Color? color,
    FontStyle? fontStyle,
    TextDecoration? textDecoration,
    FontFamily? font = FontFamily.meta,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w700,
      fontFamily: font?.name,
      color: color,
      height: 1.25,
      decoration: textDecoration,
      fontSize: size?.sp,
    );
  }

  // Meta Regular
  static TextStyle metaRegular({
    double? size,
    Color? color,
    FontStyle? fontStyle,
    TextDecoration? textDecoration,
    FontFamily? font = FontFamily.meta,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w400,
      fontFamily: font?.name,
      color: color,
      height: 1.25,
      decoration: textDecoration,
      fontSize: size,
    );
  }

  static TextStyle metaMediuam({
    double? size,
    Color? color,
    FontStyle? fontStyle,
    TextDecoration? textDecoration,
    FontFamily? font = FontFamily.meta,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w600,
      fontFamily: font?.name,
      color: color,
      height: 1.25,
      decoration: textDecoration,
      fontSize: size,
      
    );
  }
}
