import 'package:flutter/material.dart';
import '../utility/constants.dart';
import '../pages/principal/widgets/vendor_preferites_preview.dart';

class UserProvider extends ChangeNotifier {
  List<Widget> preferites = [];

  UserProvider() {
    _initPreferites();
  }

  void _initPreferites() {
    for(var v in KPreferiteVendor) {
      this.preferites.add(
          PreferitesPreview(
          selectedVendor: v,
        )
      );
    }
  }
}