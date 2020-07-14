import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './pages/principal/principal_page.dart';
import './pages/start/start_page.dart';
import './pages/principal/screens/search_screen.dart';
import './providers/principal_provider.dart';
import './providers/vendor_provider.dart';
import './providers/user_provider.dart';

void main() => runApp(Quire());

class Quire extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PrincipalProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => VendorProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: StartPage(),
        routes: <String, WidgetBuilder>{
          PrincipalPage.id: (context) => PrincipalPage(),
          SearchScreen.id: (context) => SearchScreen(),
        },
      ),
    );
  }
}
