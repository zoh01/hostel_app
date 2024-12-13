import 'dart:ui';

import 'package:flutter/cupertino.dart';

class RoomDetails {
  final String image;
  final String roomNo;
  final String block;
  final String capacity;
  final String currentCapacity;
  final String type;
  final void Function()? onTap;

  RoomDetails(
    this.image,
    this.roomNo,
    this.block,
    this.capacity,
    this.currentCapacity,
    this.type,
    this.onTap,
  );
}
