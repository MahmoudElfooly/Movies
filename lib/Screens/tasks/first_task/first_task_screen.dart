import 'package:flutter/material.dart';
import 'package:hackathon_fatura/Providers/first_task.dart';
import 'package:provider/provider.dart';

/*
 First Task : app consists of FAB and container
 when i pressed on FAB it changes container Color
 but when i pressed on FAB it Rebuild Background widget
 which it doesn't no need to rebuild
 you need to optimize build function as
 when i pressed on Button don't rebuild Background widget
 */
class FirstTaskScreen extends StatelessWidget {
  static const String routeName = '/FirstTaskScreen';

  @override
  Widget build(BuildContext context) {
    print("Building FirstTaskScreen");
    return Scaffold(
      appBar: AppBar(
        title: Text("First task"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<ChangeColorControllerFirstTask>(context, listen: false)
              .changeColor();
        },
        child: Icon(Icons.colorize),
      ),
      body: Stack(
        children: [
          Positioned.fill(child: BackgroundWidget()),
          Center(
            child: Consumer<ChangeColorControllerFirstTask>(
              builder: (_, colorController, ch) => Container(
                width: 100,
                height: 100,
                color: colorController.randomColorGetter,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class BackgroundWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("Building BackgroundWidget");

    return Container(color: Colors.amber);
  }
}
