import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hackathon_fatura/Helpers/dbHelper.dart';
import 'package:hackathon_fatura/models/movieModel.dart';

class FavouriteMovie extends ChangeNotifier {
  List<MovieData> _favouriteMovieList = [];
  List<MovieData> get favouriteMovieList => [..._favouriteMovieList];
  addFavMovie(MovieData movie) {
    _favouriteMovieList.add(movie);
    insertMovie(movie);
    notifyListeners();
  }

  removeMovie(MovieData movie) {
    _favouriteMovieList.removeWhere((element) => element.id == movie.id);
    notifyListeners();
    deleteFavouriteMovie(movie);
  }

  Future<void> insertMovie(MovieData movie) async {
    await DBHelper.insert(
      'MOVIES',
      {
        'id': movie.id,
        'movie': jsonEncode(MovieToJson.toJson(movie)),
      },
    );
  }

  Future<void> fetchFavouriteMovie() async {
    final dataList = await DBHelper.getFavMovies('MOVIES');

    _favouriteMovieList = dataList
        .map(
          (e) => MovieData.fromJson(
            json.decode(e['movie']),
          ),
        )
        .toList();
  }

  Future<void> deleteFavouriteMovie(MovieData movie) async {
    await DBHelper.deleteMovie(
      'MOVIES',
      movie.id.toString(),
    );
  }
}
