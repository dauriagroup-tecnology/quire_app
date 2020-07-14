import 'package:flutter/material.dart';
import '../../../utility/constants.dart';

class AnimatedButton extends StatelessWidget {

  final IconData icon;
  final String text;
  final Color color;
  final Function onTap;
  final bool isSelect;
  final TickerProvider ticker;

  const AnimatedButton(
      { @required this.icon,
        @required this.text,
        @required this.color,
        @required this.onTap,
        @required this.isSelect,
        @required this.ticker,
      });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: onTap,
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: isSelect ? color : Colors.black,
          ),
          SizedBox(
            width: 10.0,
          ),
          AnimatedSize(
            duration: KAnimation,
            curve: Curves.easeInOut,
            vsync: ticker,
            child: Text(
              isSelect ? text : "",
              style: TextStyle(
                color: isSelect ? color : Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 18.0,
              ),
            ),
          ),
          SizedBox(
            width: 10.0,
          ),
        ],
      ),
    );
  }
}