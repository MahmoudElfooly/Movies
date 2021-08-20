import 'package:flutter/material.dart';
import 'package:hackathon_fatura/Providers/PopularMovie.dart';
import 'package:hackathon_fatura/widgets/PaginationLoad.dart';
import 'package:hackathon_fatura/widgets/movieWiddget.dart';
import 'package:provider/provider.dart';

class PopularMovieScreen extends StatefulWidget {
  const PopularMovieScreen({Key? key}) : super(key: key);

  @override
  _PopularMovieScreenState createState() => _PopularMovieScreenState();
}

class _PopularMovieScreenState extends State<PopularMovieScreen> {
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      if (Provider.of<PopularMovie>(context, listen: false)
              .listOfMovie!
              .length ==
          0) {
        await Provider.of<PopularMovie>(context, listen: false)
            .getPopularMovie()
            .whenComplete(() {
          setState(() {
            _isLoading = false;
          });
        });
      } else {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  Future<void> _refreshPage() async {
    await Provider.of<PopularMovie>(context, listen: false).getPopularMovie();
  }

  @override
  Widget build(BuildContext context) {
    final popularMovieProvider = Provider.of<PopularMovie>(context);
    return _isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Consumer<PopularMovie>(
            builder: (_, movie, ch) => Stack(
              children: [
                NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification scrollInfo) {
                    if (scrollInfo.metrics.pixels ==
                            scrollInfo.metrics.maxScrollExtent &&
                        popularMovieProvider.page <=
                            popularMovieProvider.totalPages &&
                        !popularMovieProvider.pagentaionLoad) {
                      popularMovieProvider.changePagenationLoadState(true);
                      popularMovieProvider.getPopularMovie().then(
                            (value) => popularMovieProvider
                                .changePagenationLoadState(false),
                          );
                    }
                    return true;
                  },
                  child: RefreshIndicator(
                    onRefresh: _refreshPage,
                    child: GridView.builder(
                      itemCount: movie.listOfMovie!.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: .7,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
                      ),
                      itemBuilder: (ctx, index) => MovieItem(
                        movie: movie.listOfMovie![index],
                      ),
                    ),
                  ),
                ),
                popularMovieProvider.pagentaionLoad
                    ? LoadingSpinner()
                    : SizedBox(),
              ],
            ),
          );
  }
}
