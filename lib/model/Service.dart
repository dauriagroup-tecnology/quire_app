import 'package:flutter/material.dart';
import '../utility/constants.dart';

class Service {
  final String name;
  final int minuteDuration;
  final double price;
  final ServiceType type;

  const Service({this.name, this.minuteDuration, this.price, this.type});
}