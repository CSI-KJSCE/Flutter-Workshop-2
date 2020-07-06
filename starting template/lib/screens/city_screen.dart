import 'package:flutter/material.dart';

class CityPage extends StatefulWidget {
  @override
  _CityPageState createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fitHeight,
          image: NetworkImage(
              "https://cdn.pixabay.com/photo/2019/09/22/16/20/location-4496459_960_720.png"),
        ),
      ),
    );
  }
}
