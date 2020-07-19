import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DisplayTemperature extends StatefulWidget {
  final currentTemperature, maxTemperature, minTemperature;
  DisplayTemperature(
      {this.currentTemperature, this.maxTemperature, this.minTemperature});
  @override
  _DisplayTemperatureState createState() => _DisplayTemperatureState();
}

class _DisplayTemperatureState extends State<DisplayTemperature> {
  var _currentTemperature, _maxTemperature, _minTemperature;
  void getData() {
    _currentTemperature = widget.currentTemperature.round();
    _maxTemperature = widget.maxTemperature.round();
    _minTemperature = widget.minTemperature.round();
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    setState(() {
      getData();
    });
    return Container(
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey[600],
            blurRadius: 0.5,
            spreadRadius: 0.5,
            offset: Offset(0, 2),
          )
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          SizedBox(
            width: 35,
            height: 90,
          ),
          Text(
            '$_currentTemperature',
            style: TextStyle(
              color: Colors.grey,
              fontFamily: "SourceSans",
              fontSize: 60,
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 30),
            child: Text(
              "o",
              style: TextStyle(
                color: Colors.grey,
                fontFamily: "SourceSans",
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          SizedBox(
            width: 83,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'max temperature : $_maxTemperature',
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: "SourceSans",
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'min temperature : $_minTemperature',
                  style: TextStyle(
                    color: Colors.grey,
                    fontFamily: "SourceSans",
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
