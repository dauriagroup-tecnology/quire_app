import '../model/Booking.dart';
import '../model/Vendor.dart';

const int KHomeScreenIndex = 0;
const int KPreferitesScreenIndex = 1;
const int KSearchScreenIndex = 2;
const Duration KAnimation = Duration(milliseconds: 200);

enum ServiceType {
  TaglioUomo ,
  TaglioDonna,
  SaluteEBenessere,
  CuraDelCorpo
}

enum MenuState {
  closed,
  opening,
  open,
  closing,
}

const List<Vendor> KHomeVendor = [
  Vendor(
      name: "Ferdy's Hair Style",
      url: 'https://scontent-fco1-1.xx.fbcdn.net/v/t1.0-9/50456994_2023120234410563_3755502417026744320_n.png?_nc_cat=107&_nc_sid=09cbfe&_nc_ohc=PI3kVBLOAkAAX_3lJxq&_nc_ht=scontent-fco1-1.xx&oh=79df1c8a375e99e1d1e69f6afb72bc29&oe=5F197EA6',
      adress: "Via Vittorio Veneto, 319, 80054 Gragnano NA",
  ),
  Vendor(
      name: 'FreeStyle G2',
      url: "https://pbs.twimg.com/profile_images/716487122224439296/HWPluyjs.jpg",
      adress: "Via V. Veneto, 336, 80054 Gragnano Na"
  ),
  Vendor(
      name: 'Barba & Capelli',
      url: "https://scontent-fco1-1.xx.fbcdn.net/v/t1.0-9/46492915_1240236916117681_8509042928839032832_n.jpg?_nc_cat=109&_nc_sid=85a577&_nc_ohc=LZTO3JxiamcAX_ObDsY&_nc_ht=scontent-fco1-1.xx&oh=bd646b869c1aacd42c2d9b01d9177318&oe=5F195634",
      adress: "Via V. Veneto, 36, 80054 Gragnano Na"
  ),
  Vendor(
      name: 'Schettino Parrucchieri',
      url: "https://scontent-fco1-1.xx.fbcdn.net/v/t1.0-9/95500301_2583883478547698_329259034794262528_n.jpg?_nc_cat=101&_nc_sid=85a577&_nc_ohc=Vi5knNJvLzwAX-0kpVM&_nc_ht=scontent-fco1-1.xx&oh=904d6fd466d6b7fb9b24ddca6d39f85e&oe=5F1A42B9",
      adress: "Via Lamma, 80054 Gragnano NA",
  ),
  Vendor(
      name: 'Albe Parrucchieri',
      url: "https://scontent-fco1-1.xx.fbcdn.net/v/t1.0-9/11162451_484672775030636_7383848825522810855_n.jpg?_nc_cat=105&_nc_sid=85a577&_nc_ohc=xsRw0WjBI8wAX8hUX8A&_nc_ht=scontent-fco1-1.xx&oh=fdd256d410fcfca3b683a9cca746e8b4&oe=5F1A32A3",
      adress: "Via Roma, 67, 80054 Gragnano NA"
  ),
  Vendor(
      name: 'Cappellano Nicodemo',
      url: "https://scontent-fco1-1.xx.fbcdn.net/v/t1.0-9/13450131_253490921692210_8318904143814418559_n.jpg?_nc_cat=100&_nc_sid=85a577&_nc_ohc=dlE4r01M4Z4AX-RCOBV&_nc_ht=scontent-fco1-1.xx&oh=522ace8e576d5c369e14ee6f86974fcd&oe=5F1A3493",
      adress: "Via V. Veneto, 61, 80054 Gragnano NA"
  ),
  Vendor(
      name: 'Vendor7',
      url: "https://pbs.twimg.com/profile_images/716487122224439296/HWPluyjs.jpg",
      adress: "Via Roma, 67, 80054 Gragnano NA"
  ),
  Vendor(
      name: 'Vendor8',
      url: "https://pbs.twimg.com/profile_images/716487122224439296/HWPluyjs.jpg",
      adress: "Via Roma, 67, 80054 Gragnano NA"
  ),
  Vendor(
      name: 'Vendor9',
      url: "https://pbs.twimg.com/profile_images/716487122224439296/HWPluyjs.jpg",
      adress: "Via Roma, 67, 80054 Gragnano NA"
  ),
  Vendor(
      name: 'Vendor10',
      url: "https://pbs.twimg.com/profile_images/716487122224439296/HWPluyjs.jpg",
      adress: "Via Roma, 67, 80054 Gragnano NA"
  ),
  Vendor(
      name: 'Vendor11',
      url: "https://pbs.twimg.com/profile_images/716487122224439296/HWPluyjs.jpg",
      adress: "Via Roma, 67, 80054 Gragnano NA"
  ),
  Vendor(
      name: 'Vendor12',
      url: "https://pbs.twimg.com/profile_images/716487122224439296/HWPluyjs.jpg",
      adress: "Via Roma, 67, 80054 Gragnano NA"
  ),
  Vendor(
      name: 'Vendor13',
      url: "https://pbs.twimg.com/profile_images/716487122224439296/HWPluyjs.jpg",
      adress: "Via Roma, 67, 80054 Gragnano NA"
  ),
];

const List<Vendor> KPreferiteVendor = [
  Vendor(
    name: "Ferdy's Hair Style",
    url: 'https://scontent-fco1-1.xx.fbcdn.net/v/t1.0-9/50456994_2023120234410563_3755502417026744320_n.png?_nc_cat=107&_nc_sid=09cbfe&_nc_ohc=PI3kVBLOAkAAX_3lJxq&_nc_ht=scontent-fco1-1.xx&oh=79df1c8a375e99e1d1e69f6afb72bc29&oe=5F197EA6',
    adress: "Via Vittorio Veneto, 319, 80054 Gragnano NA",
  ),
  Vendor(
      name: 'FreeStyle G2',
      url: "https://pbs.twimg.com/profile_images/716487122224439296/HWPluyjs.jpg",
      adress: "Via V. Veneto, 336, 80054 Gragnano Na"
  ),
  Vendor(
      name: 'Barba & Capelli',
      url: "https://scontent-fco1-1.xx.fbcdn.net/v/t1.0-9/46492915_1240236916117681_8509042928839032832_n.jpg?_nc_cat=109&_nc_sid=85a577&_nc_ohc=LZTO3JxiamcAX_ObDsY&_nc_ht=scontent-fco1-1.xx&oh=bd646b869c1aacd42c2d9b01d9177318&oe=5F195634",
      adress: "Via V. Veneto, 36, 80054 Gragnano Na"
  ),
];

const List<Booking> KBooking = [
];