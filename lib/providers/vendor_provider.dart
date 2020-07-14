import '../utility/constants.dart';
import '../model/Vendor.dart';
import '../pages/principal/widgets/vendor_preview.dart';
import 'package:flutter/material.dart';

class VendorProvider extends ChangeNotifier {
  
  List<Widget> homeVendors = [];
  List<Vendor> searchVendors = [];

  VendorProvider() {
    _initHomeVendors();
  }

  void _initHomeVendors() {
    for(var v in KHomeVendor) {
      this.homeVendors.add(
          VendorPreview(
            selectedVendor: v,
          )
      );
    }
  }


}