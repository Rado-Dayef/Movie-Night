import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:movie_night/src/shared/DefaultAuthTextFormField.dart';
import 'package:movie_night/src/ui/auth/ForgotPasswordScreen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_night/src/ui/auth/SignupScreen.dart';
import 'package:movie_night/src/values/ColorPalette.dart';
import 'package:movie_night/src/shared/MyDialog.dart';
import 'package:movie_night/src/ui/SplashScreen.dart';
import 'package:movie_night/src/values/Strings.dart';
import 'package:movie_night/src/values/Dimens.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  String? emailAddress, password;
  bool isObscure = true;

  loginValidator() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      formData.save();
      var connection = await InternetConnectionChecker().hasConnection;
      if (connection == true) {
        try {
          UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: emailAddress!,
            password: password!,
          );
          return userCredential;
        } on FirebaseAuthException catch (e) {
          if (e.code == Strings.userNotFoundErrorCode) {
            defaultDialog(
              context,
              DialogType.warning,
              Strings.error,
              Strings.emailNotFound,
            );
          } else if (e.code == Strings.wrongPasswordErrorCode) {
            defaultDialog(
              context,
              DialogType.warning,
              Strings.error,
              Strings.wrongPassword,
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
                  Strings.loginTitle,
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
                      SizedBox(
                        height: Dimens.d015.h,
                      ),
                      Column(
                        children: [
                          DefaultAuthFormField(
                            color: white,
                            onSaved: (value) {
                              password = value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return Strings.passwordEmpty;
                              } else if (value.length < 8) {
                                return Strings.passwordLessThen8;
                              } else if (value.length > 24) {
                                return Strings.passwordLargerThen24;
                              }
                              return null;
                            },
                            obscure: isObscure,
                            prefixIcon: Icons.lock_outline,
                            suffixIcon: isObscure
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            suffixOnClick: () {
                              setState(
                                () {
                                  if (isObscure == true) {
                                    isObscure = false;
                                  } else {
                                    isObscure = true;
                                  }
                                },
                              );
                            },
                            labelName: Strings.password,
                            keyboardType: TextInputType.visiblePassword,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: Dimens.d000.h,
                                  horizontal: Dimens.d015.w,
                                ),
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const ForgotPasswordScreen(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    Strings.loginForgotPasswordTextButton,
                                    style: TextStyle(
                                      color: white,
                                      fontSize: Dimens.d012.sp,
                                      fontFamily: Strings.timesFont,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: Dimens.d015.h,
                ),
                InkWell(
                  onTap: () async {
                    UserCredential res = await loginValidator();
                    if (res != null) {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => SplashScreen(),
                        ),
                      );
                    }
                  },
                  child: Container(
                    height: Dimens.d050.h,
                    width: Dimens.d150.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: white,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      Strings.loginButton,
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
                      Strings.loginTextButton1,
                      style: TextStyle(
                        color: white,
                        fontSize: Dimens.d015.sp,
                        fontFamily: Strings.timesFont,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const SignupScreen(),
                          ),
                        );
                      },
                      child: Text(
                        Strings.loginTextButton2,
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
