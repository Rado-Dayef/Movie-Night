class MovieTypesTranslator {
  static String convert(Object value) {
    if (value is int) {
      return toTypes(value.toString());
    } else {
      return toTypes(value as String);
    }
  }

  static String toTypes(String value) {
    return value
        .replaceAll("28", "Action")
        .replaceAll("12", "Adventure")
        .replaceAll("16", "Animation")
        .replaceAll("35", "Comedy")
        .replaceAll("80", "Crime")
        .replaceAll("99", "Documentary")
        .replaceAll("18", "Drama")
        .replaceAll("10751", "Family")
        .replaceAll("14", "Fantasy")
        .replaceAll("36", "History")
        .replaceAll("27", "Horror")
        .replaceAll("10402", "Music")
        .replaceAll("9648", "Mystery")
        .replaceAll("10749", "Romance")
        .replaceAll("878", "Science Fiction")
        .replaceAll("10770", "TV Movie")
        .replaceAll("53", "Thriller")
        .replaceAll("10752", "War")
        .replaceAll("37", "Western");
  }
}

extension MovieTypesExtensions on String {
  String get TypesTranslator {
    return MovieTypesTranslator.convert(this);
  }
}
