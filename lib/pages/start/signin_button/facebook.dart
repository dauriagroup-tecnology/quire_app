import 'package:flutter/material.dart';
import './button.dart';


class FacebookSignInButton extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final Function onPressed;
  final double borderRadius;
  final Color splashColor;

  FacebookSignInButton({
    this.onPressed,
    this.borderRadius = defaultBorderRadius,
    this.text = 'Continua con Facebook',
    this.textStyle,
    this.splashColor,
    Key key,
  })  : assert(text != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return StretchableButton(
      buttonColor: Color(0xFF4267B2),
      borderRadius: borderRadius,
      splashColor: splashColor,
      onPressed: onPressed,
      buttonPadding: 8.0,
      children: <Widget>[
        Image(
          image: AssetImage(
            "assets/flogo-HexRBG-Wht-100.png",
          ),
          height: 24.0,
          width: 24.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15.0, right: 15.0),
          child: Text(
            text,
            style: textStyle ?? TextStyle(
              // default to the application font-style
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}