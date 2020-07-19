import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DisplayTemperature extends StatefulWidget {
  @override
  _DisplayTemperatureState createState() => _DisplayTemperatureState();
}

class _DisplayTemperatureState extends State<DisplayTemperature> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            spreadRadius: 0.5,
            blurRadius: 0.5,
            offset: Offset(2, 2),
            color: Colors.grey,
          )
        ],
        color: Colors.white,
      ),
      height: 100,
      margin: EdgeInsets.all(16),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 40,
          ),
          Text(
            "32",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 60,
              fontFamily: "SourceSans",
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 30),
            child: Text(
              'o',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey,
                fontFamily: "SourceSans",
                fontSize: 30,
              ),
            ),
          ),
          SizedBox(
            width: 70,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "max temperature : 35",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              Text(
                "min temperature : 30",
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
