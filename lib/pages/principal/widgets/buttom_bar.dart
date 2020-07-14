import 'package:flutter/material.dart';

class ButtomBar extends StatelessWidget {
  final List<Widget> bottomBarItem;

  const ButtomBar({this.bottomBarItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Colors.grey,
            width: 1.0,
          ),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: bottomBarItem
      ),
    );
  }
}


