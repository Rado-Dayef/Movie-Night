import 'package:movie_night/src/shared/TopRatedTrendingPopularMoviesContainer.dart';
import 'package:movie_night/src/shared/UpcomingMoviesContainer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_night/src/values/ColorPalette.dart';
import 'package:movie_night/src/values/Strings.dart';
import 'package:movie_night/src/values/Dimens.dart';
import 'package:movie_night/src/ui/ZoomDrawer.dart';
import 'package:movie_night/src/model/Movie.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  Future<List<Movie>>? upcomingMovies;
  Future<List<Movie>>? topRatedMovies;
  Future<List<Movie>>? trendingMovies;
  Future<List<Movie>>? popularMovies;

  HomeScreen({
    required this.upcomingMovies,
    required this.topRatedMovies,
    required this.trendingMovies,
    required this.popularMovies,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: black,
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
        child: NestedScrollView(
          physics: const NeverScrollableScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: transparent,
                floating: true,
                pinned: false,
                elevation: Dimens.d010.sp,
                expandedHeight: Dimens.d075.h,
                leading: IconButton(
                  icon: Icon(
                    Icons.menu,
                    size: Dimens.d020.sp,
                  ),
                  onPressed: () {
                    dController.toggle!();
                  },
                ),
                centerTitle: true,
                title: Text(
                  Strings.appName,
                  style: TextStyle(
                    fontSize: Dimens.d020.sp,
                    fontFamily: Strings.timesFont,
                  ),
                ),
              ),
            ];
          },
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder(
                  future: upcomingMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return UpcomingMoviesContainer(
                        listName: Strings.upcoming,
                        snapshot: snapshot,
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          color: white,
                        ),
                      );
                    }
                  },
                ),
                FutureBuilder(
                  future: topRatedMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return TopRatedTrendingPopularMoviesContainer(
                        listName: Strings.topRated,
                        snapshot: snapshot,
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          color: white,
                        ),
                      );
                    }
                  },
                ),
                FutureBuilder(
                  future: trendingMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return TopRatedTrendingPopularMoviesContainer(
                        listName: Strings.trending,
                        snapshot: snapshot,
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          color: white,
                        ),
                      );
                    }
                  },
                ),
                FutureBuilder(
                  future: popularMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(snapshot.error.toString()),
                      );
                    } else if (snapshot.hasData) {
                      return TopRatedTrendingPopularMoviesContainer(
                        listName: Strings.popular,
                        snapshot: snapshot,
                      );
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          color: white,
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
