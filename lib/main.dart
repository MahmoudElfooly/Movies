import 'package:flutter/material.dart';
import 'package:hackathon_fatura/Providers/PopularMovie.dart';
import 'package:hackathon_fatura/Providers/favouriteMovie.dart';
import 'package:hackathon_fatura/Providers/first_task.dart';
import 'package:hackathon_fatura/Providers/recentMovie.dart';
import 'package:hackathon_fatura/Providers/secondeTask.dart';

import 'package:provider/provider.dart';

import 'Screens/home.dart';
import 'Screens/tasks/first_task/first_task_screen.dart';
import 'Screens/tasks/second_task/second_task_screen.dart';
import 'Screens/tasks/third_task/third_task_screen.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ChangeColorControllerFirstTask(),
        ),
        ChangeNotifierProvider(
          create: (_) => ChangeColorControllerSeconedTask(),
        ),
        ChangeNotifierProvider(
          create: (_) => PopularMovie(),
        ),
        ChangeNotifierProvider(
          create: (_) => RecentMovie(),
        ),
        ChangeNotifierProvider(
          create: (_) => FavouriteMovie(),
        ),
      ],
      child: MaterialApp(
        title: 'Fatura Hackathon',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: MyHomePage(),
        routes: {
          ThirdTaskScreen.routeName: (ctx) => ThirdTaskScreen(),
          FirstTaskScreen.routeName: (ctx) => FirstTaskScreen(),
          SecondTaskScreen.routeName: (ctx) => SecondTaskScreen(),
        },
      ),
    );
  }
}
