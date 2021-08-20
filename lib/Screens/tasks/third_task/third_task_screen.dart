import 'package:flutter/material.dart';
import 'package:hackathon_fatura/Screens/tasks/third_task/favouriteMovie.dart';
import 'package:hackathon_fatura/Screens/tasks/third_task/popularMovie.dart';
import 'package:hackathon_fatura/Screens/tasks/third_task/recentMovie.dart';

/* Create a movie mobile application that get popular And recent movies
with an ability to add movie to Favourite list that will be offline
storage on device (use any way you want) that will be displayed
in favorite tabs

- design of this app is attached in project folder
- Adding a progress indicator when information is loading
- Deal with errors coming from the backend (because eventually it will happen!)
- Create model objects for the API data retrieved to avoid working with dynamic (serialisation/deserialisation?)
- Add some sort of state management to show how that is done (InheritedWidget, Provider, GetIt, Mobx and so on)
- add pagination mechanism
 */
class ThirdTaskScreen extends StatelessWidget {
  static const String routeName = '/ThirdTaskScreen';
  final _tabs = <Tab>[
    const Tab(
      text: 'POPULAR',
    ),
    const Tab(
      text: 'TOP RATED',
    ),
    const Tab(
      text: 'FAVOURITE',
    ),
  ];
  final _tabPages = <Widget>[
    const PopularMovieScreen(),
    const TopRatedMovieScreen(),
    const FavouriteMovieScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Movies'),
          centerTitle: true,
          bottom: TabBar(
            tabs: _tabs,
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: TabBarView(
              children: [
                ..._tabPages,
              ],
            )),
      ),
    );
  }
}
