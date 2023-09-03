import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:movie_night/src/ui/auth/LoginScreen.dart';
import 'package:movie_night/src/values/ColorPalette.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:movie_night/src/values/Strings.dart';
import 'package:movie_night/src/ui/ZoomDrawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:movie_night/src/model/Movie.dart';
import 'package:movie_night/src/service/API.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

bool? isLogin;

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? name;
  String? image;
  late Future<List<Movie>> upcomingMovies,
      topRatedMovies,
      trendingMovies,
      popularMovies;

  getName() async {
    FirebaseFirestore.instance
        .collection(Strings.usersCollection)
        .where(
      Strings.emailDocument,
      isEqualTo: "${FirebaseAuth.instance.currentUser!.email}",
    )
        .get()
        .then(
          (value) {
        value.docs.forEach(
              (element) {
            name = element.data()[Strings.nameDocument];
          },
        );
      },
    );
    return name;
  }

  getImage() async {
    FirebaseFirestore.instance
        .collection(Strings.usersCollection)
        .where(
      Strings.emailDocument,
      isEqualTo: "${FirebaseAuth.instance.currentUser!.email}",
    )
        .get()
        .then(
          (value) {
        value.docs.forEach(
              (element) {
            image = element.data()[Strings.imageDocument];
          },
        );
      },
    );
    return image;
  }

  @override
  void initState() {
    upcomingMovies = API().getUpcoming();
    topRatedMovies = API().getTopRated();
    trendingMovies = API().getTrendingMovies();
    popularMovies = API().getPopularMovies();
    var user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      isLogin = false;
    } else {
      isLogin = true;
      getName();
      getImage();
    }
    Future.delayed(
      const Duration(
        seconds: 3,
      ),
      () async {
        var connection = await InternetConnectionChecker().hasConnection;
        if (connection == true) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => isLogin == false
                  ? const LoginScreen()
                  : Zoom(
                      name: name,
                      image: image,
                      upcomingMovies: upcomingMovies,
                      topRatedMovies: topRatedMovies,
                      trendingMovies: trendingMovies,
                      popularMovies: popularMovies,
                    ),
            ),
          );
        } else {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
          );
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
      body: Container(
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
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Lottie.asset(Strings.splashAnimation),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
