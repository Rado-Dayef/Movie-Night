import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_night/src/ui/MovieDetailsScreen.dart';
import 'package:movie_night/src/values/ColorPalette.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movie_night/src/values/Strings.dart';
import 'package:movie_night/src/values/Dimens.dart';
import 'package:flutter/material.dart';

class UpcomingMoviesContainer extends StatelessWidget {
  String? listName;
  final AsyncSnapshot? snapshot;

  UpcomingMoviesContainer({
    required this.listName,
    required this.snapshot,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
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
          height: Dimens.d020.h,
        ),
        CarouselSlider.builder(
          itemCount: snapshot!.data.length,
          options: CarouselOptions(
            height: Dimens.d250.h,
            autoPlay: true,
            viewportFraction: 0.55,
            enlargeCenterPage: true,
            pageSnapping: true,
            autoPlayCurve: Curves.easeIn,
            autoPlayAnimationDuration: const Duration(
              seconds: 1,
            ),
          ),
          itemBuilder: (context, itemIndex, pageViewIndex) {
            return InkWell(
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
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Dimens.d020.sp),
                  border: Border.all(
                    color: white,
                    width: 2.w,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
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
