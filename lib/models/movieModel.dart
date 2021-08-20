//Movie Response
import 'dart:convert';

MovieModel movieResponse(String data) {
  final dyn = json.decode(data);
  return MovieModel.fromJson(dyn);
}

class MovieModel {
  int? page;
  List<MovieData>? results;
  int? totalPages;
  int? totalResults;

  MovieModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results =
          (json['results'] as List).map((v) => MovieData.fromJson(v)).toList();
    }
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }
}

class MovieData {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  dynamic popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  dynamic voteAverage;
  dynamic voteCount;

  MovieData.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'] ?? '';
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }
}

class MovieToJson {
  static Map<String, dynamic> toJson(MovieData movie) {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = movie.adult;
    data['backdrop_path'] = movie.backdropPath;
    data['genre_ids'] = movie.genreIds;
    data['id'] = movie.id;
    data['original_language'] = movie.originalLanguage;
    data['original_title'] = movie.originalTitle;
    data['overview'] = movie.overview;
    data['popularity'] = movie.popularity;
    data['poster_path'] = movie.posterPath;
    data['release_date'] = movie.releaseDate;
    data['title'] = movie.title;
    data['video'] = movie.video;
    data['vote_average'] = movie.voteAverage;
    data['vote_count'] = movie.voteCount;
    return data;
  }
}
