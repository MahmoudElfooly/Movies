class APIs {
  static const String baseUrl = "https://api.themoviedb.org/";
  static String getMovie(int page, String moviesSortBy) =>
      baseUrl +
      '3/discover/movie?api_key=a06a65f8e9b7f4e31d4cdee71b82fc83&sort_by=$moviesSortBy&page=$page';
  static const String baseImagePath = "https://image.tmdb.org/t/p/w500";
}
