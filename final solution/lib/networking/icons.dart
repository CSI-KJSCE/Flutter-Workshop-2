import 'package:flutter/material.dart';

Image getImage(String name) {
  if (name == "Shower") {
    return Image.asset("images/rain.png");
  } else if (name == "Cloudy") {
    return Image.asset('images/cloud.png');
  } else if (name == "ThunderStorm") {
    return Image.asset('images/thunderstorm.png');
  } else if (name == "Sunny") {
    return Image.asset('images/sun.png');
  }
}
