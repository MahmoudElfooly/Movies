import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_fatura/apis/apiServices.dart';
import 'package:hackathon_fatura/apis/api_client.dart';
import 'package:hackathon_fatura/models/movieModel.dart';
import 'package:hackathon_fatura/utility/commun.dart';

class PopularMovie extends ChangeNotifier {
  static const String moviesSortBy = "popularity.desc";
  //set list of movie
  List<MovieData>? _listOfMovie = [];
  List<MovieData>? get listOfMovie => [..._listOfMovie!];
  setListMovie(List<MovieData> fetchingList) {
    if (_page == 1) {
      _listOfMovie = [...fetchingList];
    } else {
      _listOfMovie!.addAll(fetchingList);
    }
  }

  int _totalPages = 1;
  int get totalPages => _totalPages;
  int _page = 1;
  int get page => _page;
  //Count Page by one
  countPage() {
    _page++;
    notifyListeners();
  }

  //Reset page
  resetPageCount() {
    _page = 1;
    notifyListeners();
  }

// get movie data
  Future getPopularMovie() async {
    await ApiServices.getMovie(page: page, movieSortBy: moviesSortBy)
        .catchError((error) {
      Commun.showToast(
        genericHandleErrorResponse(error),
      );
    }).then((value) {
      setListMovie(value.results!);
      _totalPages = value.totalPages!;
      countPage();
      notifyListeners();
    });
  }

  // Pagination
  bool _paginationLoad = false;
  bool get pagentaionLoad => _paginationLoad;
  changePagenationLoadState(bool val) {
    _paginationLoad = val;
    notifyListeners();
  }
}
