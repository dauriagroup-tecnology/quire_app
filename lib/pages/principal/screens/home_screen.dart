import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import '../../../providers/vendor_provider.dart';

class HomeScreen extends StatefulWidget {
  static const id = 'HomeScreen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<Widget> _vendorPreview = [];

  static final _containerHeight = 45.0;

  var _allowReverse = true;
  var _allowForward = true;
  var _prevOffset = 0.0;
  var _prevForwardOffset = -_containerHeight;
  var _prevReverseOffset = 0.0;

  var scrollController = ScrollController();
  var fromTop = 0.0;

  void _scrollListener() {
    if (scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      setState(() {
        _showSearchBar();
      });
    } else if (scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      setState(() {
        _hideSearchBar();
      });
    }
  }

  void _hideSearchBar() {
    _allowReverse = true;
    if (_allowForward) {
      _allowForward = false;
      _prevOffset = scrollController.offset / 10;
      _prevReverseOffset = fromTop;
    }
    fromTop = _prevReverseOffset + _prevOffset - scrollController.offset / 10;
    if (fromTop < -_containerHeight) fromTop = -_containerHeight;
  }

  void _showSearchBar() {
    _allowForward = true;
    if (_allowReverse) {
      _allowReverse = false;
      _prevOffset = scrollController.offset / 10;
      _prevForwardOffset = fromTop;
    }
    fromTop = _prevForwardOffset + _prevOffset - scrollController.offset / 10;
    if (fromTop > 0) fromTop = 0;
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        ListView(
          controller: scrollController,
          children: Provider.of<VendorProvider>(context).homeVendors,
        ),
        Positioned(
          top: fromTop,
          left: 0,
          right: 0,
          child: Container(
            height: 45,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 18.0, right: 18.0, top: 5.0, bottom: 5.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(30)),
                child: TextField(
                  textAlignVertical: TextAlignVertical.center,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Cerca il tuo salone di bellezza'),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
