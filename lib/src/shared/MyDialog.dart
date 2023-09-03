import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_night/src/values/ColorPalette.dart';
import 'package:movie_night/src/values/Strings.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:movie_night/src/values/Dimens.dart';
import 'package:flutter/material.dart';

void defaultDialog(
  context,
  DialogType type,
  String title,
  String body,
) {
  AwesomeDialog(
    context: context,
    dialogType: type,
    animType: AnimType.scale,
    title: title,
    body: Container(
      height: Dimens.d150.h,
      alignment: Alignment.center,
      padding: EdgeInsets.all(Dimens.d010.sp),
      child: Text(
        body,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: black,
          fontSize: Dimens.d018.sp,
          fontFamily: Strings.timesFont,
        ),
      ),
    ),
  ).show();
}

void defaultDialogWithOnDismiss(
  context,
  DialogType type,
  Function(DismissType) onDismiss,
  String title,
  String body,
) {
  AwesomeDialog(
    context: context,
    dialogType: type,
    animType: AnimType.scale,
    onDismissCallback: onDismiss,
    title: title,
    body: Container(
      height: Dimens.d150.h,
      alignment: Alignment.center,
      padding: EdgeInsets.all(Dimens.d010.sp),
      child: Text(
        body,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: black,
          fontSize: Dimens.d018.sp,
          fontFamily: Strings.timesFont,
        ),
      ),
    ),
  ).show();
}
