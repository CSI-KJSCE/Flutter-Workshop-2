import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CityPage extends StatefulWidget {
  @override
  _CityPageState createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  String typedData;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Container(
            color: Colors.lightBlue[100],
            child: ListView(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
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
                        ]),
                    margin: EdgeInsets.all(20),
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      elevation: 0,
                      disabledElevation: 0,
                      backgroundColor: Colors.lightBlue[100],
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 32, vertical: 64),
                  child: TextField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide.none),
                      hintStyle: TextStyle(color: Colors.grey),
                      hintText: "Enter city name",
                      icon: Icon(
                        Icons.location_city,
                        color: Colors.white,
                      ),
                    ),
                    onChanged: (value) {
                      typedData = value;
                    },
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.pop(context, typedData);
                  },
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.red[100],
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      'Get Weather',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
