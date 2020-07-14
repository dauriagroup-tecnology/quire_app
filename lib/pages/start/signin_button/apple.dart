import 'package:flutter/material.dart';
import './button.dart';

const double defaultBorderRadius = 3.0;

enum AppleButtonStyle { white, whiteOutline, black }

class AppleSignInButton extends StatelessWidget {
  final String text;
  final AppleButtonStyle style;
  final double borderRadius;
  final Function onPressed;
  final TextStyle textStyle;
  final Color splashColor;

  /// Creates a new button. Set [darkMode] to `true` to use the dark
  /// black background variant with white text, otherwise an all-white background
  /// with dark text is used.
  AppleSignInButton(
      {this.onPressed,
        this.text = 'Accedi con Apple',
        this.textStyle,
        this.splashColor,
        this.style = AppleButtonStyle.white,
        this.borderRadius = defaultBorderRadius,
        Key key})
      : assert(text != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return StretchableButton(
      buttonColor: style == AppleButtonStyle.black ? Colors.black : Colors.white,
      borderRadius: borderRadius,
      splashColor: splashColor,
      buttonBorderColor: style == AppleButtonStyle.whiteOutline ? Colors.black : null,
      onPressed: onPressed,
      buttonPadding: 8.0,
      children: <Widget>[
        Center(
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Container(
                  height: 38.0,
                  width: 32.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(this.borderRadius),
                  ),
                  child: Center(
                    child: Image(
                      image: AssetImage(
                        "assets/apple_logo_${style == AppleButtonStyle.black ? "white" : "black"}.png",
                      ),
                      height: 24.0,
                      width: 24.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 8.0, 32.0, 8.0),
                child: Text(
                  text,
                  style: textStyle ?? TextStyle(
                    fontSize: 16.0,
                    fontFamily: "SF Pro",
                    fontWeight: FontWeight.w500,
                    color: style == AppleButtonStyle.black
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}