import 'package:hackathon_fatura/apis/api_client.dart';
import 'package:hackathon_fatura/apis/endpoints.dart';
import 'package:hackathon_fatura/models/movieModel.dart';

class ApiServices {
  // Get Movie Data
  static Future<MovieModel> getMovie(
      {required int page, required String movieSortBy}) async {
    return await getCallService(
      APIs.getMovie(page, movieSortBy),
      RequestType.GetMovieData,
    );
  }
}
