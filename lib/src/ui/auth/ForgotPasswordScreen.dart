import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:movie_night/src/shared/DefaultAuthTextFormField.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_night/src/ui/auth/LoginScreen.dart';
import 'package:movie_night/src/values/ColorPalette.dart';
import 'package:movie_night/src/shared/MyDialog.dart';
import 'package:movie_night/src/values/Strings.dart';
import 'package:movie_night/src/values/Dimens.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  String? emailAddress;

  forgotPasswordValidator() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      formData.save();
      var connection = await InternetConnectionChecker().hasConnection;
      if (connection == true) {
        try {
          await FirebaseAuth.instance
              .sendPasswordResetEmail(
            email: emailAddress!,
          )
              .then(
            (value) {
              defaultDialogWithOnDismiss(
                context,
                DialogType.success,
                (type) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
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
      } else {
        defaultDialog(
          context,
          DialogType.warning,
          Strings.error,
          Strings.checkYourInternetConnection,
        );
      }
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
                Text(
                  Strings.forgotPasswordTitle,
                  style: TextStyle(
                    color: white,
                    fontSize: Dimens.d024.sp,
                    fontFamily: Strings.timesFont,
                  ),
                ),
                SizedBox(
                  height: Dimens.d025.h,
                ),
                Form(
                  key: formState,
                  child: Column(
                    children: [
                      DefaultAuthFormField(
                        color: white,
                        onSaved: (value) {
                          emailAddress = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return Strings.emailEmpty;
                          } else if (!value.contains(Strings.atSign)) {
                            return Strings.emailMessingAtSign;
                          }
                          return null;
                        },
                        obscure: false,
                        prefixIcon: Icons.email_outlined,
                        labelName: Strings.emailAddress,
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Dimens.d015.h,
                ),
                InkWell(
                  onTap: () async {
                    await forgotPasswordValidator();
                  },
                  child: Container(
                    height: Dimens.d050.h,
                    width: Dimens.d150.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: white,
                      ),
                      borderRadius: BorderRadius.circular(Dimens.d012.sp),
                    ),
                    child: Text(
                      Strings.forgotPasswordButton,
                      style: TextStyle(
                        color: white,
                        fontSize: Dimens.d020.sp,
                        fontFamily: Strings.timesFont,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimens.d010.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      Strings.forgotPasswordTextButton1,
                      style: TextStyle(
                        color: white,
                        fontSize: Dimens.d015.sp,
                        fontFamily: Strings.timesFont,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        Strings.forgotPasswordTextButton2,
                        style: TextStyle(
                          color: white,
                          fontSize: Dimens.d015.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: Strings.timesFont,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
