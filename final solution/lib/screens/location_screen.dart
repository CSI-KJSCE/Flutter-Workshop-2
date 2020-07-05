import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:startingtemplate/Data/currentData.dart';
import 'package:startingtemplate/networking/icons.dart';
import 'package:startingtemplate/networking/networking.dart';
import 'package:startingtemplate/screens/city_screen.dart';
import 'package:startingtemplate/widgets/temperature_tile.dart';

TextStyle sunPositioningData =
    TextStyle(color: Colors.white, fontFamily: "SourceSans", fontSize: 15);

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  dynamic currentData;
  @override
  void initState() {
    super.initState();
    currentData = getCurrentData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.lightBlue[100],
          body: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.lightBlueAccent[100],
                    Colors.lightBlue[100],
                    Colors.lightBlueAccent[100],
                    Colors.lightBlue[100],
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Container(
                          margin: EdgeInsets.all(8),
                          child: FlatButton(
                            onPressed: () {
                              setState(() {
                                currentData = getCurrentData();
                              });
                            },
                            child: Icon(
                              Icons.location_on,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 180.0),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          margin: EdgeInsets.all(8),
                          child: FlatButton(
                            onPressed: () async {
                              var typedName = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CityPage()),
                              );
                              setState(() {
                                if (typedName != null) {
                                  currentData =
                                      getCityData(typedName.toLowerCase());
                                }
                              });
                            },
                            child: Icon(
                              Icons.location_searching,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text(
                        "${currentData["main"]}",
                        style: TextStyle(
                            fontSize: 50,
                            fontFamily: "SourceSans",
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: 150,
                      margin:
                          EdgeInsets.symmetric(horizontal: 64, vertical: 16),
                      child: getImage(currentData["main"]),
                    ),
                  ),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(16, 40, 32, 8),
                        child: Column(
                          children: <Widget>[
                            Text(
                              'Sunrise : ${currentData["sunrise"]}',
                              style: sunPositioningData,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              'Sunset : ${currentData["sunset"]}',
                              style: sunPositioningData,
                            ),
                          ],
                        ),
                      )),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(16, 32, 16, 8),
                      child: Text(
                        '${currentData["city"]}',
                        style: TextStyle(
                          fontSize: 60,
                          fontFamily: "SourceSans",
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  DisplayTemperature(
                    currentTemperature: currentData["current_temp"],
                    maxTemperature: currentData["max_temperature"],
                    minTemperature: currentData["min_temperature"],
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
