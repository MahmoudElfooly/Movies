import 'package:flutter/material.dart';
import 'package:hackathon_fatura/Providers/favouriteMovie.dart';
import 'package:hackathon_fatura/Screens/tasks/first_task/first_task_screen.dart';
import 'package:hackathon_fatura/Screens/tasks/second_task/second_task_screen.dart';
import 'package:hackathon_fatura/Screens/tasks/third_task/third_task_screen.dart';
import 'package:provider/provider.dart';

import '../../task.dart';

class MyHomePage extends StatelessWidget {
  final tasks = [
    Task(
        name: "First task",
        description: "Optimize build method",
        screen: FirstTaskScreen.routeName),
    Task(
      name: "Second task",
      description: "Optimize build method",
      screen: SecondTaskScreen.routeName,
    ),
    Task(
        name: "Third task",
        description: "Make movieApp",
        screen: ThirdTaskScreen.routeName)
  ];

  MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fatura Hackathon"),
      ),
      body: FutureBuilder(
        future: Provider.of<FavouriteMovie>(context, listen: false)
            .fetchFavouriteMovie(),
        builder: (context, snapshoot) =>
            snapshoot.connectionState == ConnectionState.waiting
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemBuilder: (_, index) => ListTile(
                      title: Text(tasks[index].name),
                      subtitle: Text(tasks[index].description),
                      onTap: () {
                        Navigator.of(context).pushNamed(tasks[index].screen);
                      },
                    ),
                    itemCount: tasks.length,
                  ),
      ),
    );
  }
}
