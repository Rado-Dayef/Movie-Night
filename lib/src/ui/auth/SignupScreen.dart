import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:movie_night/src/shared/DefaultAuthTextFormField.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_night/src/values/ColorPalette.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_night/src/shared/MyDialog.dart';
import 'package:movie_night/src/ui/SplashScreen.dart';
import 'package:movie_night/src/values/Strings.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:movie_night/src/values/Dimens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  GlobalKey<FormState> formState = GlobalKey<FormState>();
  var imageURL = Strings.defaultAvatar;
  String? userName, emailAddress, password;
  bool isObscure = true;

  signupValidator() async {
    var formData = formState.currentState;
    if (formData!.validate()) {
      formData.save();
      var connection = await InternetConnectionChecker().hasConnection;
      if (connection == true) {
        try {
          UserCredential userCredential =
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: emailAddress!,
            password: password!,
          );
          if (userCredential.user!.emailVerified == false) {
            await FirebaseFirestore.instance
                .collection(Strings.usersCollection)
                .add(
              {
                Strings.nameDocument: userName,
                Strings.emailDocument: emailAddress,
                Strings.imageDocument: imageURL,
              },
            );
            User? user = FirebaseAuth.instance.currentUser;
            await user!.sendEmailVerification().then(
              (value) {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => SplashScreen(),
                  ),
                  (Route route) => false,
                );
              },
            );
          } else {
            return userCredential;
          }
        } on FirebaseAuthException catch (e) {
          if (e.code == Strings.emailAlreadyInUseErrorCode) {
            defaultDialog(
              context,
              DialogType.warning,
              Strings.error,
              Strings.emailInUse,
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
                  Strings.sighupTitle,
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
                      InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            backgroundColor: transparentBlack,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(Dimens.d050.sp),
                                bottom: Radius.circular(Dimens.d000.sp),
                              ),
                            ),
                            context: context,
                            builder: (context) {
                              return Container(
                                height: Dimens.d200.h,
                                alignment: Alignment.center,
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          setState(
                                            () {
                                              imageURL = Strings.avatar1;
                                            },
                                          );
                                          Navigator.of(context).pop();
                                        },
                                        child: CircleAvatar(
                                          radius: Dimens.d050.sp,
                                          backgroundColor: transparentWhite,
                                          backgroundImage: const NetworkImage(
                                            Strings.avatar1,
                                          ),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: white,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(Dimens.d100.sp),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              setState(
                                                () {
                                                  imageURL = Strings.avatar2;
                                                },
                                              );
                                              Navigator.of(context).pop();
                                            },
                                            child: CircleAvatar(
                                              radius: Dimens.d050.sp,
                                              backgroundColor: transparentWhite,
                                              backgroundImage:
                                                  const NetworkImage(
                                                Strings.avatar2,
                                              ),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: white,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(Dimens.d100.sp),
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              setState(
                                                () {
                                                  imageURL = Strings.avatar3;
                                                },
                                              );
                                              Navigator.of(context).pop();
                                            },
                                            child: CircleAvatar(
                                              radius: Dimens.d050.sp,
                                              backgroundColor: transparentWhite,
                                              backgroundImage:
                                                  const NetworkImage(
                                                Strings.avatar3,
                                              ),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: white,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(Dimens.d100.sp),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: CircleAvatar(
                          radius: Dimens.d050.sp,
                          backgroundColor: transparentBlack,
                          backgroundImage: NetworkImage(
                            imageURL,
                          ),
                          child: Container(
                            height: double.infinity,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: transparentBlack,
                              border: Border.all(color: white),
                              borderRadius: BorderRadius.circular(Dimens.d100.sp),
                            ),
                            child: Icon(
                              Icons.add_rounded,
                              color: white,
                              size: Dimens.d050.sp,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: Dimens.d015.h,
                      ),
                      DefaultAuthFormField(
                        color: white,
                        onSaved: (value) {
                          userName = value;
                        },
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return Strings.userNameEmpty;
                          } else if (value.length < 4) {
                            return Strings.userNameLessThen4;
                          } else if (value.length > 24) {
                            return Strings.userNameLargerThen24;
                          }
                          return null;
                        },
                        obscure: false,
                        prefixIcon: Icons.person_outline,
                        labelName: Strings.userName,
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: Dimens.d015.h,
                      ),
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
                    ],
                  ),
                ),
                SizedBox(
                  height: Dimens.d015.h,
                ),
                InkWell(
                  onTap: () async {
                    await signupValidator();
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
                      Strings.sighupTitle,
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
                      Strings.signupTextButton1,
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
                        Strings.signupTextButton2,
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
