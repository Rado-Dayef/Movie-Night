import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_night/src/values/ColorPalette.dart';
import 'package:movie_night/src/values/Strings.dart';
import 'package:movie_night/src/values/Dimens.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              black,
              blue,
            ],
          ),
        ),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: Dimens.d250.h,
                width: Dimens.d200.w,
                decoration: BoxDecoration(
                  color: transparent,
                  border: Border.all(
                    color: white,
                  ),
                  borderRadius: BorderRadius.circular(Dimens.d020.sp),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(Dimens.d020.sp),
                  child: Image.asset(
                    Strings.myImage,
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: Dimens.d015.h,
              ),
              Text(
                Strings.myName,
                style: TextStyle(
                  color: white,
                  fontSize: Dimens.d040.sp,
                  fontFamily: Strings.timesFont,
                ),
              ),
              SizedBox(
                height: Dimens.d015.h,
              ),
              Text(
                Strings.myEmail,
                style: TextStyle(
                  color: white,
                  fontSize: Dimens.d015.sp,
                  fontFamily: Strings.timesFont,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
