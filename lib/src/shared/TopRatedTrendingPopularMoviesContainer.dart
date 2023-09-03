import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_night/src/ui/MovieDetailsScreen.dart';
import 'package:movie_night/src/values/ColorPalette.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movie_night/src/values/Strings.dart';
import 'package:movie_night/src/values/Dimens.dart';
import 'package:flutter/material.dart';

class TopRatedTrendingPopularMoviesContainer extends StatelessWidget {
  String? listName;
  final AsyncSnapshot? snapshot;

  TopRatedTrendingPopularMoviesContainer({
    required this.listName,
    required this.snapshot,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: Dimens.d000.h,
            right: Dimens.d000.w,
            bottom: Dimens.d000.h,
            left: Dimens.d005.w,
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "$listName",
              style: TextStyle(
                color: white,
                fontSize: Dimens.d024.sp,
                fontFamily: Strings.timesFont,
              ),
            ),
          ),
        ),
        SizedBox(
          height: Dimens.d010.h,
        ),
        CarouselSlider.builder(
          itemCount: snapshot!.data.length,
          options: CarouselOptions(
            scrollPhysics: const BouncingScrollPhysics(),
            height: Dimens.d150.h,
            autoPlay: false,
            viewportFraction: 0.8,
            enableInfiniteScroll: false,
            enlargeCenterPage: true,
            pageSnapping: true,
            autoPlayCurve: Curves.easeIn,
          ),
          itemBuilder: (context, itemIndex, pageViewIndex) {
            return Padding(
              padding: EdgeInsets.symmetric(
                vertical: Dimens.d010.h,
                horizontal: Dimens.d005.w,
              ),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        return MovieDetailsScreen(
                          movie: snapshot!.data[itemIndex],
                        );
                      },
                    ),
                  );
                },
                child: Container(
                  height: Dimens.d125.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: transparentBlack,
                    border: Border.all(
                      color: white,
                    ),
                    borderRadius: BorderRadius.circular(Dimens.d020.sp),
                  ),
                  child: Stack(
                    children: [
                      Container(
                        height: double.infinity,
                        width: Dimens.d120.w,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: white,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(Dimens.d020.sp),
                            topRight: Radius.circular(Dimens.d010.sp),
                            bottomRight: Radius.circular(Dimens.d010.sp),
                            bottomLeft: Radius.circular(Dimens.d020.sp),
                          ),
                        ),
                        child: ClipRRect(
                          // borderRadius: BorderRadius.circular(20),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(Dimens.d020.sp),
                            topRight: Radius.circular(Dimens.d010.sp),
                            bottomRight: Radius.circular(Dimens.d010.sp),
                            bottomLeft: Radius.circular(Dimens.d020.sp),
                          ),
                          child: SizedBox(
                            height: Dimens.d300.h,
                            width: Dimens.d200.w,
                            child: Image.network(
                              "${Strings.imagesBaseUrl}${snapshot!.data[itemIndex].posterPath}",
                              filterQuality: FilterQuality.high,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: Dimens.d005.h,
                          right: Dimens.d005.w,
                          bottom: Dimens.d005.h,
                          left: Dimens.d140.w,
                        ),
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${snapshot!.data[itemIndex].title}",
                                  style: TextStyle(
                                    color: white,
                                    fontSize: Dimens.d018.sp,
                                    fontFamily: Strings.timesFont,
                                  ),
                                ),
                                SizedBox(
                                  height: Dimens.d015.h,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star_rounded,
                                      color: yellow,
                                    ),
                                    SizedBox(
                                      width: Dimens.d002.w,
                                    ),
                                    Text(
                                      "${snapshot!.data[itemIndex].voteAverage.toStringAsFixed(1)}",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: white,
                                        fontSize: Dimens.d018.sp,
                                        fontFamily: Strings.timesFont,
                                      ),
                                    ),
                                    SizedBox(
                                      width: Dimens.d010.w,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: Dimens.d015.h,
                                ),
                                Text(
                                  "${snapshot!.data[itemIndex].releaseDate}",
                                  style: TextStyle(
                                    color: white,
                                    fontSize: Dimens.d012.sp,
                                    fontFamily: Strings.timesFont,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
        Divider(
          color: white,
          height: Dimens.d025.h,
          thickness: Dimens.d001.sp,
          indent: Dimens.d005.w,
          endIndent: Dimens.d005.w,
        ),
      ],
    );
  }
}
