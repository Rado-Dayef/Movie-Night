import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_night/src/values/ColorPalette.dart';
import 'package:movie_night/src/values/Strings.dart';
import 'package:movie_night/src/values/Dimens.dart';
import 'package:flutter/material.dart';

class DefaultAuthFormField extends StatelessWidget {
  Color? color;
  bool? obscure;
  String? labelName;
  String? initVal;
  IconData? prefixIcon;
  IconData? suffixIcon;
  TextInputType? keyboardType;
  VoidCallback? suffixOnClick;
  void Function(String?)? onSaved;
  String? Function(String?)? validator;

  DefaultAuthFormField({
    super.key,
    this.initVal,
    this.onSaved,
    this.validator,
    this.suffixIcon,
    this.suffixOnClick,
    required this.color,
    required this.obscure,
    required this.labelName,
    required this.prefixIcon,
    required this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: Dimens.d000.h,
        horizontal: Dimens.d015.w,
      ),
      child: TextFormField(
        validator: validator,
        onSaved: onSaved,
        initialValue: initVal,
        keyboardType: keyboardType,
        obscureText: obscure!,
        cursorColor: color,
        style: TextStyle(
          color: color,
          fontFamily: Strings.timesFont,
        ),
        decoration: InputDecoration(
          labelText: '$labelName',
          labelStyle: TextStyle(
            color: color,
            fontFamily: Strings.timesFont,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimens.d015.sp),
            borderSide: BorderSide(
              color: color!,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimens.d015.sp),
            borderSide: BorderSide(
              color: color!,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimens.d015.sp),
            borderSide: BorderSide(
              color: color!,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimens.d015.sp),
            borderSide: BorderSide(
              color: color!,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimens.d015.sp),
            borderSide: BorderSide(
              color: red,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(Dimens.d015.sp),
            borderSide: BorderSide(
              color: red,
            ),
          ),
          errorStyle: TextStyle(
            color: red,
          ),
          prefixIconColor: color,
          prefixIcon: Icon(
            prefixIcon,
          ),
          suffixIconColor: color,
          suffixIcon: InkWell(
            onTap: suffixOnClick,
            child: Icon(
              suffixIcon,
            ),
          ),
        ),
      ),
    );
  }
}
