import 'package:flutter/material.dart';
import 'package:hackathon_fatura/Providers/recentMovie.dart';
import 'package:hackathon_fatura/widgets/PaginationLoad.dart';
import 'package:hackathon_fatura/widgets/movieWiddget.dart';
import 'package:provider/provider.dart';

class TopRatedMovieScreen extends StatefulWidget {
  const TopRatedMovieScreen({Key? key}) : super(key: key);

  @override
  _TopRatedMovieScreenState createState() => _TopRatedMovieScreenState();
}

class _TopRatedMovieScreenState extends State<TopRatedMovieScreen> {
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      if (Provider.of<RecentMovie>(context, listen: false)
              .listOfMovie!
              .length ==
          0) {
        await Provider.of<RecentMovie>(context, listen: false)
            .getRecentMovie()
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
    await Provider.of<RecentMovie>(context, listen: false).getRecentMovie();
  }

  @override
  Widget build(BuildContext context) {
    final recentMovieProvider = Provider.of<RecentMovie>(context);
    return _isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Consumer<RecentMovie>(
            builder: (_, movie, ch) => Stack(
              children: [
                NotificationListener<ScrollNotification>(
                  onNotification: (ScrollNotification scrollInfo) {
                    if (scrollInfo.metrics.pixels ==
                            scrollInfo.metrics.maxScrollExtent &&
                        recentMovieProvider.page <=
                            recentMovieProvider.totalPages &&
                        !recentMovieProvider.pagentaionLoad) {
                      recentMovieProvider.changePagenationLoadState(true);
                      recentMovieProvider.getRecentMovie().then(
                            (value) => recentMovieProvider
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
                recentMovieProvider.pagentaionLoad
                    ? LoadingSpinner()
                    : SizedBox(),
              ],
            ),
          );
  }
}
