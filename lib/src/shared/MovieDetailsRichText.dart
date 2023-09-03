import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_night/src/values/ColorPalette.dart';
import 'package:movie_night/src/values/Strings.dart';
import 'package:movie_night/src/values/Dimens.dart';
import 'package:flutter/material.dart';

class MovieDetailsRichText extends StatelessWidget {

  String? title;
  String? subTitle;

  MovieDetailsRichText({
    this.title,
    this.subTitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: Dimens.d005.h,
        horizontal: Dimens.d010.w,
      ),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: "$title : ",
              style: TextStyle(
                color: white,
                fontSize: Dimens.d015.sp,
                fontFamily: Strings.timesFont,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextSpan(
              text: "$subTitle",
              style: TextStyle(
                color: white,
                fontSize: Dimens.d015.sp,
                fontFamily: Strings.timesFont,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
