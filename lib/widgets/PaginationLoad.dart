import 'package:flutter/material.dart';

class LoadingSpinner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        width: 100,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey[400],
        ),
        child: Center(
          child: CircularProgressIndicator(
            backgroundColor: Colors.red,
          ),
        ),
      ),
    );
  }
}
