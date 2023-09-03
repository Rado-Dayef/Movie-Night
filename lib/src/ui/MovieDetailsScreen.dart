import 'package:movie_night/src/util/MovieTypesTranslator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_night/src/shared/CastsContainer.dart';
import 'package:movie_night/src/values/ColorPalette.dart';
import 'package:movie_night/src/values/Strings.dart';
import 'package:movie_night/src/values/Dimens.dart';
import 'package:movie_night/src/model/Movie.dart';
import 'package:movie_night/src/service/API.dart';
import 'package:movie_night/src/model/Cast.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:readmore/readmore.dart';
import 'package:flutter/material.dart';

class MovieDetailsScreen extends StatefulWidget {
  Movie? movie;

  MovieDetailsScreen({
    required this.movie,
    super.key,
  });

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  late Future<String> movieTrailer;
  late Future<List<Cast>> movieCastList;

  @override
  void initState() {
    movieTrailer = API().getYoutubeId(widget.movie!.id!);
    movieCastList = API().getCastList(widget.movie!.id!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> movieTypes = widget.movie!.genreIds as List<dynamic>;
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
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverAppBar.large(
              floating: true,
              pinned: false,
              elevation: Dimens.d000.sp,
              expandedHeight: Dimens.d450.h,
              leading: Container(),
              flexibleSpace: FlexibleSpaceBar(
                background: ClipRRect(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: double.infinity,
                        width: double.infinity,
                        child: Image.network(
                          "${Strings.imagesBaseUrl}${widget.movie!.posterPath}",
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.fill,
                          opacity: const AlwaysStoppedAnimation(0.7),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          var url = await movieTrailer;
                          await launch(url);
                        },
                        child: Icon(
                          Icons.play_circle_outline,
                          color: white,
                          size: Dimens.d100.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(Dimens.d010.w),
                    child: Text(
                      "${widget.movie!.title}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: white,
                        fontSize: Dimens.d040.sp,
                        fontFamily: Strings.timesFont,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Dimens.d010.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      widget.movie!.voteAverage! <= 1.4
                          ? Icon(
                              Icons.star_half_rounded,
                              color: yellow,
                              size: Dimens.d024.sp,
                            )
                          : widget.movie!.voteAverage! >= 1.5
                              ? Icon(
                                  Icons.star_rounded,
                                  color: yellow,
                                  size: Dimens.d024.sp,
                                )
                              : Icon(
                                  Icons.star_border_rounded,
                                  color: yellow,
                                  size: Dimens.d024.sp,
                                ),
                      widget.movie!.voteAverage! <= 3.4 &&
                              widget.movie!.voteAverage! >= 2.0
                          ? Icon(
                              Icons.star_half_rounded,
                              color: yellow,
                              size: Dimens.d024.sp,
                            )
                          : widget.movie!.voteAverage! >= 3.5
                              ? Icon(
                                  Icons.star_rounded,
                                  color: yellow,
                                  size: Dimens.d024.sp,
                                )
                              : Icon(
                                  Icons.star_border_rounded,
                                  color: yellow,
                                  size: Dimens.d024.sp,
                                ),
                      widget.movie!.voteAverage! <= 5.4 &&
                              widget.movie!.voteAverage! >= 4.0
                          ? Icon(
                              Icons.star_half_rounded,
                              color: yellow,
                              size: Dimens.d024.sp,
                            )
                          : widget.movie!.voteAverage! >= 5.5
                              ? Icon(
                                  Icons.star_rounded,
                                  color: yellow,
                                  size: Dimens.d024.sp,
                                )
                              : Icon(
                                  Icons.star_border_rounded,
                                  color: yellow,
                                  size: Dimens.d024.sp,
                                ),
                      widget.movie!.voteAverage! <= 7.4 &&
                              widget.movie!.voteAverage! >= 6.0
                          ? Icon(
                              Icons.star_half_rounded,
                              color: yellow,
                              size: Dimens.d024.sp,
                            )
                          : widget.movie!.voteAverage! >= 7.5
                              ? Icon(
                                  Icons.star_rounded,
                                  color: yellow,
                                  size: Dimens.d024.sp,
                                )
                              : Icon(
                                  Icons.star_border_rounded,
                                  color: yellow,
                                  size: Dimens.d024.sp,
                                ),
                      widget.movie!.voteAverage! <= 9.4 &&
                              widget.movie!.voteAverage! >= 8.0
                          ? Icon(
                              Icons.star_half_rounded,
                              color: yellow,
                              size: Dimens.d024.sp,
                            )
                          : widget.movie!.voteAverage! >= 10.0
                              ? Icon(
                                  Icons.star_rounded,
                                  color: yellow,
                                  size: Dimens.d024.sp,
                                )
                              : Icon(
                                  Icons.star_border_rounded,
                                  color: yellow,
                                  size: Dimens.d024.sp,
                                ),
                    ],
                  ),
                  SizedBox(
                    height: Dimens.d025.h,
                  ),
                  SizedBox(
                    height: Dimens.d040.h,
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: movieTypes.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: Dimens.d040.h,
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(Dimens.d010.sp),
                          decoration: BoxDecoration(
                            color: transparentBlack,
                            border: Border.all(
                              color: white,
                            ),
                            borderRadius:
                                BorderRadius.circular(Dimens.d020.sp),
                          ),
                          child: Text(
                            "${movieTypes[index]}".TypesTranslator,
                            style: TextStyle(
                              color: white,
                              fontSize: Dimens.d018.sp,
                              fontFamily: Strings.timesFont,
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(
                        width: Dimens.d010.sp,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Dimens.d010.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: Dimens.d000.h,
                      horizontal: Dimens.d010.w,
                    ),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                          text: Strings.movieRate,
                          style: TextStyle(
                            color: white,
                            fontSize: Dimens.d014.sp,
                            fontFamily: Strings.timesFont,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                          children: [
                            TextSpan(
                              text:
                                  widget.movie!.voteAverage!.toStringAsFixed(1),
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
                  SizedBox(
                    height: Dimens.d010.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: Dimens.d000.h,
                      horizontal: Dimens.d010.w,
                    ),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                          text: Strings.movieLanguage,
                          style: TextStyle(
                            color: white,
                            fontSize: Dimens.d014.sp,
                            fontFamily: Strings.timesFont,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                          children: [
                            TextSpan(
                              text: "${widget.movie!.originalLanguage}",
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
                  SizedBox(
                    height: Dimens.d010.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: Dimens.d000.h,
                      horizontal: Dimens.d010.w,
                    ),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: RichText(
                        text: TextSpan(
                          text: Strings.movieReleaseDate,
                          style: TextStyle(
                            color: white,
                            fontSize: Dimens.d014.sp,
                            fontFamily: Strings.timesFont,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                          children: [
                            TextSpan(
                              text: "${widget.movie!.releaseDate}",
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
                  SizedBox(
                    height: Dimens.d010.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: Dimens.d000.h,
                      horizontal: Dimens.d010.w,
                    ),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        Strings.movieOverview,
                        style: TextStyle(
                          color: white,
                          fontSize: Dimens.d024.sp,
                          fontFamily: Strings.timesFont,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: Dimens.d005.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: Dimens.d000.w,
                      right: Dimens.d010.w,
                      bottom: Dimens.d000.w,
                      left: Dimens.d020.w,
                    ),
                    child: ReadMoreText(
                      "${widget.movie!.overview}",
                      trimLines: 3,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: Strings.showMore,
                      trimExpandedText: Strings.showLess,
                      style: TextStyle(
                        color: white,
                        fontSize: Dimens.d018.sp,
                        fontFamily: Strings.timesFont,
                      ),
                      moreStyle: TextStyle(
                        color: white,
                        fontSize: Dimens.d012.sp,
                        fontFamily: Strings.timesFont,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                      lessStyle: TextStyle(
                        color: white,
                        fontSize: Dimens.d012.sp,
                        fontFamily: Strings.timesFont,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  FutureBuilder(
                    future: movieCastList,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      } else if (snapshot.hasData) {
                        return CastsContainer(
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
                  Divider(
                    color: white,
                    height: Dimens.d025.h,
                    thickness: Dimens.d001.sp,
                    indent: Dimens.d005.w,
                    endIndent: Dimens.d005.w,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        height: Dimens.d250.sp,
                        width: Dimens.d340.sp,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: white,
                          ),
                          borderRadius: BorderRadius.circular(Dimens.d020.sp),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(Dimens.d020.sp),
                          child: Image.network(
                            "${Strings.imagesBaseUrl}${widget.movie!.backdropPath}",
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.fill,
                            opacity: const AlwaysStoppedAnimation(.7),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          var url = await movieTrailer;
                          await launch(url);
                        },
                        child: Icon(
                          Icons.play_circle_outline,
                          color: white,
                          size: Dimens.d100.sp,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: white,
                    height: Dimens.d025.h,
                    thickness: Dimens.d001.sp,
                    indent: Dimens.d005.w,
                    endIndent: Dimens.d005.w,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
