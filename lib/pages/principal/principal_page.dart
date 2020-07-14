import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/menu_screen.dart';
import './widgets/animated_buttom.dart';
import './widgets/buttom_bar.dart';
import '../../utility/constants.dart';
import '../../providers/principal_provider.dart';

class PrincipalPage extends StatefulWidget {
  static const id = 'AnimatedScreen';
  @override
  _PrincipalPageState createState() => new _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage>
    with TickerProviderStateMixin {

  AnimationController _animationController;
  MenuState state = MenuState.closed;

  Curve scaleDownCurve = Interval(0.0, 0.3, curve: Curves.easeOut);
  Curve scaleUpCurve = Interval(0.0, 1.0, curve: Curves.easeOut);
  Curve slideOutCurve = Interval(0.0, 1.0, curve: Curves.easeOut);
  Curve slideInCurve = Interval(0.0, 1.0, curve: Curves.easeOut);

  zoomAndSlideContent(Widget content) {
    var slidePercent, scalePercent;

    switch (state) {
      case MenuState.closed:
        slidePercent = 0.0;
        scalePercent = 0.0;
        break;
      case MenuState.open:
        slidePercent = 1.0;
        scalePercent = 1.0;
        break;
      case MenuState.opening:
        slidePercent = slideOutCurve.transform(_animationController.value);
        scalePercent = scaleDownCurve.transform(_animationController.value);
        break;
      case MenuState.closing:
        slidePercent = slideInCurve.transform(_animationController.value);
        scalePercent = scaleUpCurve.transform(_animationController.value);
        break;
    }

    final slideAmount = 275.0 * slidePercent;
    final contentScale = 1.0 - (0.2 * scalePercent);
    final cornerRadius = 16.0 * _animationController.value;

    return new Transform(
      transform: Matrix4.translationValues(slideAmount, 0.0, 0.0)
        ..scale(contentScale, contentScale),
      alignment: Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.white,
              offset: const Offset(0.0, 5.0),
              blurRadius: 15.0,
              spreadRadius: 10.0,
            ),
          ],
        ),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(cornerRadius), child: content),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
    _animationController
      ..duration = const Duration(milliseconds: 250)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((AnimationStatus status) {
        switch (status) {
          case AnimationStatus.forward:
            state = MenuState.opening;
            break;
          case AnimationStatus.reverse:
            state = MenuState.closing;
            break;
          case AnimationStatus.completed:
            state = MenuState.open;
            break;
          case AnimationStatus.dismissed:
            state = MenuState.closed;
            break;
        }
      });
  }

  @override
  void dispose() {
    super.dispose();
    _animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container (
          child: Scaffold(
            body: MenuScreen(
              onUpdate: (details) {
                setState(() {
                  if (state == MenuState.open) {
                    _animationController.reverse();
                  } else if (state == MenuState.closed) {
                    _animationController.forward();
                  }
                });
              },
            ),
          ),
        ),
        zoomAndSlideContent(IgnorePointer(
          ignoring: state == MenuState.open,
          child: Container(
            color: Colors.white,
            child: SafeArea(
              child: Scaffold(
                backgroundColor: Colors.white,
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(40.0),
                  child: AppBar(
                    leading: IconButton(
                        icon: Icon(
                          Icons.account_circle,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            if (state == MenuState.open) {
                              _animationController.reverse();
                            } else if (state == MenuState.closed) {
                              _animationController.forward();
                            }
                          });
                        }),
                    title: Text(
                      'quire',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Indie Flower',
                          fontWeight: FontWeight.w600,
                          fontSize: 30),
                    ),
                    actions: <Widget>[
                      AnimatedButton(
                        text: 'Cerca',
                        icon: Icons.search,
                        color: Colors.redAccent,
                        ticker: this,
                        isSelect: Provider.of<PrincipalProvider>(context).menuIndex == KSearchScreenIndex,
                        onTap: () {
                          Provider.of<PrincipalProvider>(context).onClickNavigationButton(KSearchScreenIndex);
                        },
                      ),
                    ],
                    elevation: 0,
                    backgroundColor: Colors.white,
                  ),
                ),
                body: Container(
                  color: Colors.white,
                  child: Provider.of<PrincipalProvider>(context).principalScreenBody,
                ),
                bottomNavigationBar: ButtomBar(
                  bottomBarItem: <Widget>[
                    AnimatedButton(
                      text: 'Home',
                      icon: Icons.home,
                      color: Colors.redAccent,
                      ticker: this,
                      onTap: () {
                        Provider.of<PrincipalProvider>(context).onClickNavigationButton(KHomeScreenIndex);

                      },
                      isSelect: Provider.of<PrincipalProvider>(context).menuIndex == KHomeScreenIndex,
                    ),
                    AnimatedButton(
                      text: 'Preferiti',
                      icon: Icons.star,
                      color: Colors.redAccent,
                      ticker: this,
                      onTap: () {
                        Provider.of<PrincipalProvider>(context).onClickNavigationButton(KPreferitesScreenIndex);
                      },
                      isSelect: Provider.of<PrincipalProvider>(context).menuIndex == KPreferitesScreenIndex,
                    ),
                  ],
                ),
              ),
            ),
          ),
        )),
      ],
    );
  }
}
