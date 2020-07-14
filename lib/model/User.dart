import '../model/Vendor.dart';
import '../model/Booking.dart';
import '../utility/constants.dart';

class User {
  List<Vendor> vendorPreferites = [];
  List<Booking> reservation = [];

  User() {
    KPreferiteVendor.map((v) => vendorPreferites.add(v));
    KBooking.map((r) => reservation.add(r));
   }

}