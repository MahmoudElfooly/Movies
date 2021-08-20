import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_fatura/models/change_colors.dart';

class ChangeColorControllerFirstTask extends ChangeColors with ChangeNotifier {
  Color _randomColor = Colors.black;
  Color get randomColorGetter => _randomColor;
  @override
  changeColor() {
    _randomColor = Colors.primaries[random.nextInt(Colors.primaries.length)];
    notifyListeners();
  }
}
