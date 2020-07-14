import 'package:flutter/material.dart';

const double defaultBorderRadius = 3.0;

const imageAsset = [
  "assets/flogo-HexRBG-Wht-100.png",
  "assets/apple_logo_black.png",
  "assets/google-logo.png",
];


class StretchableButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double buttonPadding;
  final Color buttonColor, splashColor, textColor;
  final String imageUrl;
  final String text;


  StretchableButton({
    @required this.buttonColor,
    @required this.imageUrl,
    @required this.text,
    @required this.textColor,
    this.splashColor,
    this.onPressed,
    this.buttonPadding,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
          height: 45.0,
          padding: EdgeInsets.only(left: 30, right: 30),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          child: RaisedButton(
            elevation: 10,
            onPressed: onPressed,
            color: buttonColor,
            splashColor: splashColor,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget> [
                Image(
                  image: AssetImage(
                    imageUrl,
                  ),
                  height: 24.0,
                  width: 24.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    text,
                    style: TextStyle(
                      // default to the application font-style
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
    );
  }
}