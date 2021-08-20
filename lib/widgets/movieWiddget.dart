import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_fatura/Providers/favouriteMovie.dart';
import 'package:hackathon_fatura/apis/endpoints.dart';
import 'package:hackathon_fatura/models/movieModel.dart';
import 'package:provider/provider.dart';

class MovieItem extends StatelessWidget {
  final MovieData movie;

  MovieItem({
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all()),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 4,
            child: movie.posterPath == null
                ? Center(
                    child: Icon(Icons.error),
                  )
                : CachedNetworkImage(
                    imageUrl: APIs.baseImagePath + movie.posterPath!,
                    placeholder: (context, url) => Center(
                        child: Container(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator(),
                    )),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    fit: BoxFit.fill,
                  ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      movie.originalTitle!,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Consumer<FavouriteMovie>(
                    builder: (_, favorite, ch) => IconButton(
                      onPressed: () {
                        favorite.favouriteMovieList
                                .any((favmovie) => favmovie.id == movie.id)
                            ? favorite.removeMovie(movie)
                            : favorite.addFavMovie(movie);
                      },
                      icon: Icon(
                        Icons.favorite,
                        color: favorite.favouriteMovieList
                                .any((favmovie) => favmovie.id == movie.id)
                            ? Colors.red[900]
                            : Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
