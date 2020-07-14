import 'package:flutter/material.dart';
import '../principal/principal_page.dart';
import './signin_button/sign_button.dart';

class StartPage extends StatelessWidget {
  static const id = 'SigninScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 100),
              child: Text(
                'quire',
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Indie Flower',
                    fontWeight: FontWeight.w900,
                    fontSize: 100),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                StretchableButton(
                  text: 'Continua con Facebook',
                  imageUrl: "assets/flogo-HexRBG-Wht-100.png",
                  buttonColor: Color(0xFF4267B2),
                  textColor: Colors.white,
                  buttonPadding: 15,
                  onPressed: () {
                    Navigator.pushNamed(context, PrincipalPage.id);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                StretchableButton(
                  text: 'Accedi con Google',
                  imageUrl: "assets/google-logo.png",
                  buttonColor: Colors.white,
                  textColor: Colors.black,
                  buttonPadding: 15,
                  onPressed: () {
                    Navigator.pushNamed(context, PrincipalPage.id);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                StretchableButton(
                  text: 'Accedi con IOS',
                  imageUrl: "assets/apple_logo_black.png",
                  buttonColor: Colors.white,
                  textColor: Colors.black,
                  buttonPadding: 15,
                  onPressed: () {
                    Navigator.pushNamed(context, PrincipalPage.id);
                  },
                ),
                SizedBox(
                  height: 100,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
