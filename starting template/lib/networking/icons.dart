import 'package:flutter/material.dart';

Image getImage(int name) {
  if (name == 200 ||
      name == 201 ||
      name == 202 ||
      name == 210 ||
      name == 211 ||
      name == 212 ||
      name == 221 ||
      name == 230 ||
      name == 231 ||
      name == 232) {
    return Image.asset("images/thunderstorm.png");
  } else if (name == 600 ||
      name == 601 ||
      name == 602 ||
      name == 611 ||
      name == 612 ||
      name == 613 ||
      name == 615 ||
      name == 616 ||
      name == 620 ||
      name == 621 ||
      name == 622 ||
      name == 701 ||
      name == 711 ||
      name == 721 ||
      name == 731 ||
      name == 741 ||
      name == 751 ||
      name == 761 ||
      name == 762 ||
      name == 771 ||
      name == 781 ||
      name == 801 ||
      name == 802 ||
      name == 803 ||
      name == 804) {
    return Image.asset('images/cloud.png');
  } else if (name == 300 ||
      name == 301 ||
      name == 302 ||
      name == 310 ||
      name == 311 ||
      name == 312 ||
      name == 313 ||
      name == 314 ||
      name == 321 ||
      name == 500 ||
      name == 501 ||
      name == 502 ||
      name == 503 ||
      name == 504 ||
      name == 511 ||
      name == 520 ||
      name == 521 ||
      name == 522 ||
      name == 531) {
    return Image.asset('images/rain.png');
  } else if (name == 800) {
    return Image.asset('images/sun.png');
  }
}
