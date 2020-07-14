import 'package:flutter/material.dart';

class CircularImage extends StatelessWidget {
  final double _width, _height;
  final bool _border;
  final ImageProvider image;

  CircularImage(this.image, {bool border = false, double width = 40, double height = 40})
      : _width = width,
        _height = height,
        _border = border;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration (
        shape: BoxShape.circle,
        color: Colors.white
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          width: _width,
          height: _height,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
              image: DecorationImage(image: image),
        ),
      ),
    )
    );
  }
}