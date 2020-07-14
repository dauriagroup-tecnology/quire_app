import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../providers/user_provider.dart';

class PreferitesScreen extends StatelessWidget {
  static const id = 'ProfileScreen';

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: Provider.of<UserProvider>(context).preferites,
    );
  }
}
