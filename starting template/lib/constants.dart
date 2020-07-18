import 'package:flutter/material.dart';

BoxDecoration backButton =
    BoxDecoration(borderRadius: BorderRadius.circular(30), boxShadow: [
  BoxShadow(
    color: Color(0x88000000),
    offset: Offset(2, 2),
    blurRadius: 2,
    spreadRadius: 1,
  ),
  BoxShadow(
    color: Color(0x88ffffff),
    offset: Offset(-2, -2),
    blurRadius: 2,
    spreadRadius: 1,
  ),
]);
