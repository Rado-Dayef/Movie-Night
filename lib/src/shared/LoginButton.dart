import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_night/src/values/Strings.dart';
import 'package:movie_night/src/values/Dimens.dart';
import 'package:flutter/material.dart';

class DefaultLoginAndSignUpButton extends StatelessWidget {
  VoidCallback? onClick;
  Color? backGroundColor;
  Color? textColor;
  String? buttonName;

  DefaultLoginAndSignUpButton({
    super.key,
    required this.onClick,
    required this.backGroundColor,
    required this.textColor,
    required this.buttonName,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        height: Dimens.d040.h,
        width: Dimens.d150.w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backGroundColor,
          borderRadius: BorderRadius.circular(Dimens.d015.sp),
        ),
        child: Text(
          '$buttonName',
          style: TextStyle(
            color: textColor,
            fontSize: Dimens.d020.sp,
            fontFamily: Strings.timesFont,
          ),
        ),
      ),
    );
  }
}
