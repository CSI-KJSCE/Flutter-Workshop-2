import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DisplayTemperature extends StatefulWidget {
  final int currentTemperature, maxTemperature, minTemperature;
  DisplayTemperature(
      {this.currentTemperature, this.maxTemperature, this.minTemperature});
  @override
  _DisplayTemperatureState createState() => _DisplayTemperatureState();
}

class _DisplayTemperatureState extends State<DisplayTemperature> {
  int _currentTemperature, _maxTemperature, _minTemperature;
  void getData() {
    _currentTemperature = widget.currentTemperature;
    _maxTemperature = widget.maxTemperature;
    _minTemperature = widget.minTemperature;
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(
            width: 52,
            height: 90,
          ),
          Text(
            '$_currentTemperature',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 60,
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 30),
            child: Text(
              "o",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            width: 83,
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'max temperature : $_maxTemperature',
                  style: TextStyle(color: Colors.grey),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'min temperature : $_minTemperature',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
