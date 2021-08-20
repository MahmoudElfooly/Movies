import 'package:flutter/material.dart';
import 'package:hackathon_fatura/Providers/favouriteMovie.dart';
import 'package:hackathon_fatura/widgets/movieWiddget.dart';
import 'package:provider/provider.dart';

class FavouriteMovieScreen extends StatelessWidget {
  const FavouriteMovieScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<FavouriteMovie>(
      builder: (_, movie, ch) => GridView.builder(
        itemCount: movie.favouriteMovieList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: .7,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        itemBuilder: (ctx, index) => MovieItem(
          movie: movie.favouriteMovieList[index],
        ),
      ),
    );
  }
}
