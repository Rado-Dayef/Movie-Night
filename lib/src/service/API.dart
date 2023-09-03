import 'package:movie_night/src/values/Strings.dart';
import 'package:movie_night/src/model/Movie.dart';
import 'package:movie_night/src/model/Cast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class API {
  Future<List<Movie>> getUpcoming() async {
    final response = await http.get(
      Uri.parse(Strings.upcomingMoviesURL),
    );
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)[Strings.results] as List;
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception(Strings.error);
    }
  }

  Future<List<Movie>> getTopRated() async {
    final response = await http.get(
      Uri.parse(Strings.topRatedMoviesURL),
    );
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)[Strings.results] as List;
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception(Strings.error);
    }
  }

  Future<List<Movie>> getTrendingMovies() async {
    final response = await http.get(
      Uri.parse(Strings.trendingMoviesURL),
    );
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)[Strings.results] as List;
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception(Strings.error);
    }
  }

  Future<List<Movie>> getPopularMovies() async {
    final response = await http.get(
      Uri.parse(Strings.popularMoviesURL),
    );
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)[Strings.results] as List;
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception(Strings.error);
    }
  }

  Future<String> getYoutubeId(int movieId) async {
    final response = await http.get(
      Uri.parse("${Strings.baseURL}/movie/$movieId/videos?${Strings.apiKey}"),
    );

    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)[Strings.results][0]["key"];
      String movieTrailer = "${Strings.youtubeBaseUrl}$decodeData";
      return Future.value(movieTrailer);
    } else {
      throw Exception(Strings.error);
    }
  }

  Future<List<Cast>> getCastList(int movieId) async {
    final response = await http.get(
      Uri.parse("${Strings.baseURL}/movie/$movieId/credits?${Strings.apiKey}"),
    );
    if (response.statusCode == 200) {
      final decodeData = json.decode(response.body)[Strings.cast] as List;
      return decodeData.map((cast) => Cast.fromJson(cast)).toList();
    } else {
      throw Exception(Strings.error);
    }
  }
}
