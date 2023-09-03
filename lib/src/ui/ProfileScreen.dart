import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_night/src/values/ColorPalette.dart';
import 'package:movie_night/src/ui/auth/LoginScreen.dart';
import 'package:movie_night/src/shared/MyDialog.dart';
import 'package:movie_night/src/values/strings.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:movie_night/src/values/Dimens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  String? name;
  String? image;

  ProfileScreen({
    required this.name,
    required this.image,
    super.key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  forgotPasswordFromProfileValidator() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(
        email: "${FirebaseAuth.instance.currentUser!.email}",
      )
          .then(
        (value) {
          defaultDialog(
            context,
            DialogType.success,
            Strings.success,
            Strings.emailSendSuccessfullyToChangePassword,
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == Strings.userNotFoundErrorCode) {
        defaultDialog(
          context,
          DialogType.warning,
          Strings.error,
          Strings.emailNotFound,
        );
      }
    } catch (e) {
      defaultDialog(
        context,
        DialogType.warning,
        Strings.error,
        "$e",
      );
    }
  }

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
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CircleAvatar(
                  radius: Dimens.d050.sp,
                  backgroundColor: transparentBlack,
                  backgroundImage: NetworkImage(
                    "${widget.image}",
                  ),
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: white,
                      ),
                      borderRadius: BorderRadius.circular(Dimens.d100.sp),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(Dimens.d010.w),
                  child: Text(
                    "${widget.name}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: white,
                      fontSize: Dimens.d030.sp,
                      fontFamily: Strings.timesFont,
                    ),
                  ),
                ),
                Text(
                  "${FirebaseAuth.instance.currentUser!.email}",
                  style: TextStyle(
                    color: white,
                    fontSize: Dimens.d015.sp,
                    fontFamily: Strings.timesFont,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                SizedBox(
                  height: Dimens.d025.sp,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () async {
                        await forgotPasswordFromProfileValidator();
                      },
                      child: Container(
                        height: Dimens.d050.h,
                        width: Dimens.d125.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: white,
                          ),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          Strings.resetPassword,
                          style: TextStyle(
                            color: white,
                            fontSize: Dimens.d015.sp,
                            fontFamily: Strings.timesFont,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        FirebaseAuth.instance.signOut().then(
                          (value) {
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                              (Route route) => false,
                            );
                          },
                        );
                      },
                      child: Container(
                        height: Dimens.d050.h,
                        width: Dimens.d125.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: white,
                          ),
                          borderRadius: BorderRadius.circular(Dimens.d010.sp),
                        ),
                        child: Text(
                          Strings.logout,
                          style: TextStyle(
                            color: white,
                            fontSize: Dimens.d015.sp,
                            fontFamily: Strings.timesFont,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
