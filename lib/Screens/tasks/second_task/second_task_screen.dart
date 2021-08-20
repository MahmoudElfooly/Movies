import 'package:flutter/material.dart';
import 'package:hackathon_fatura/Providers/secondeTask.dart';
import 'package:provider/provider.dart';

/*
 Second Task : app consists of FAB and container
 when i pressed on FAB it changes container Color
 but when i pressed on FAB it Rebuild Background widget
 which it doesn't no need to rebuild
 you need to optimize build function as
 when i pressed on Button don't rebuild Background widget
 */
class SecondTaskScreen extends StatelessWidget {
  static const String routeName = '/SecondTaskScreen';

  @override
  Widget build(BuildContext context) {
    print("Building SecondTaskScreen");
    return Scaffold(
      appBar: AppBar(
        title: Text("Second task"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<ChangeColorControllerSeconedTask>(context, listen: false)
              .changeColor();
        },
        child: Icon(Icons.colorize),
      ),
      body: BackgroundWidget(
        child: Center(
          child: Consumer<ChangeColorControllerSeconedTask>(
            builder: (_, colorController, ch) => Container(
              width: 100,
              height: 100,
              color: colorController.randomColorGetter,
            ),
          ),
        ),
      ),
    );
  }
}

class BackgroundWidget extends StatelessWidget {
  final Widget child;

  BackgroundWidget({required this.child});

  @override
  Widget build(BuildContext context) {
    print("Building BackgroundWidget");

    return Container(color: Colors.amber, child: child);
  }
}
