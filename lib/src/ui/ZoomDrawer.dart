import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_night/src/ui/auth/LoginScreen.dart';
import 'package:movie_night/src/values/ColorPalette.dart';
import 'package:movie_night/src/ui/ProfileScreen.dart';
import 'package:movie_night/src/ui/AboutUsScreen.dart';
import 'package:movie_night/src/values/Strings.dart';
import 'package:movie_night/src/values/Dimens.dart';
import 'package:movie_night/src/ui/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_night/src/model/Movie.dart';
import 'package:flutter/material.dart';

final ZoomDrawerController dController = ZoomDrawerController();

class Zoom extends StatelessWidget {
  Future<List<Movie>>? upcomingMovies;
  Future<List<Movie>>? topRatedMovies;
  Future<List<Movie>>? trendingMovies;
  Future<List<Movie>>? popularMovies;
  String? name;
  String? image;

  Zoom({
    required this.name,
    required this.image,
    required this.upcomingMovies,
    required this.topRatedMovies,
    required this.trendingMovies,
    required this.popularMovies,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: dController,
      borderRadius: Dimens.d020.sp,
      style: DrawerStyle.defaultStyle,
      showShadow: true,
      angle: -12,
      openCurve: Curves.fastEaseInToSlowEaseOut,
      slideWidth: Dimens.d300.w,
      duration: const Duration(milliseconds: 250),
      menuBackgroundColor: Colors.transparent,
      mainScreen: HomeScreen(
        upcomingMovies: upcomingMovies,
        topRatedMovies: topRatedMovies,
        trendingMovies: trendingMovies,
        popularMovies: popularMovies,
      ),
      menuScreen: Scaffold(
        backgroundColor: black,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CircleAvatar(
                  backgroundColor: white,
                  radius: Dimens.d050.sp,
                  backgroundImage: NetworkImage("$image"),
                ),
                Container(
                  width: Dimens.d200.sp,
                  padding: EdgeInsets.all(Dimens.d020.sp),
                  child: Column(
                    children: [
                      Text(
                        "$name",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: white,
                          fontSize: Dimens.d024.sp,
                          fontFamily: Strings.timesFont,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: Dimens.d025.sp,
                  color: white,
                  indent: Dimens.d025.sp,
                  endIndent: Dimens.d025.sp,
                ),
                GestureDetector(
                  onTap: () {
                    dController.close?.call()?.then(
                          (value) => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => ProfileScreen(
                                name: name,
                                image:
                                    "$image",
                              ),
                            ),
                          ),
                        );
                  },
                  child: Container(
                    height: Dimens.d040.h,
                    width: Dimens.d225.w,
                    alignment: Alignment.center,
                    child: ListTile(
                      leading: Icon(
                        Icons.person_outline,
                        color: white,
                        size: Dimens.d024.sp,
                      ),
                      titleAlignment: ListTileTitleAlignment.center,
                      title: Text(
                        Strings.profile,
                        maxLines: 1,
                        style: TextStyle(
                          color: white,
                          fontSize: Dimens.d024.sp,
                          fontFamily: Strings.timesFont,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    dController.close?.call()?.then(
                          (value) => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const AboutUsScreen(),
                            ),
                          ),
                        );
                  },
                  child: Container(
                    height: Dimens.d040.h,
                    width: Dimens.d225.w,
                    alignment: Alignment.center,
                    child: ListTile(
                      leading: Icon(
                        Icons.info_outline,
                        color: white,
                        size: Dimens.d024.sp,
                      ),
                      titleAlignment: ListTileTitleAlignment.center,
                      title: Text(
                        Strings.aboutUs,
                        maxLines: 1,
                        style: TextStyle(
                          color: white,
                          fontSize: Dimens.d024.sp,
                          fontFamily: Strings.timesFont,
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    FirebaseAuth.instance.signOut().then(
                      (value) {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    height: Dimens.d040.h,
                    width: Dimens.d225.w,
                    alignment: Alignment.center,
                    child: ListTile(
                      leading: Icon(
                        Icons.logout_outlined,
                        color: white,
                        size: Dimens.d024.sp,
                      ),
                      titleAlignment: ListTileTitleAlignment.center,
                      title: Text(
                        Strings.logout,
                        maxLines: 1,
                        style: TextStyle(
                          color: white,
                          fontSize: Dimens.d024.sp,
                          fontFamily: Strings.timesFont,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
