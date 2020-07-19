import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:startingtemplate/Data/currentData.dart';
import 'package:startingtemplate/networking/icons.dart';
import 'package:startingtemplate/networking/networking.dart';
import 'package:startingtemplate/screens/city_screen.dart';
import 'package:startingtemplate/widgets/temperature_tile.dart';
import 'package:geolocator/geolocator.dart';

bool showSpinner = true;

TextStyle sunPositioningData = TextStyle(
  color: Colors.white,
  fontFamily: "SourceSans",
  fontSize: 15,
);

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Position position;
  void getCurrentLocation() async {
    try {
      position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      currentData = await getCurrentData(
          long: position.longitude, lat: position.latitude);
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  void cityData(String cityName) async {
    try {
      currentData =
          await getCityData(cityName, position.longitude, position.latitude);
      setState(() {});
    } catch (e) {
      print(e);
    }
  }

  dynamic currentData;
  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    print(currentData);
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.lightBlue[100],
          body: currentData != null
              ? Container(
                  padding: EdgeInsets.only(top: 15),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQgGFkdxhud9hocp_AvQp0JfUG57dXPLM10yw&usqp=CAU",
                    ),
                    fit: BoxFit.cover,
                  )),
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
                                    getCurrentLocation();
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
                                      cityData(typedName.toLowerCase());
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
                          margin:
                              EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          child: Text(
                            jsonDecode(currentData)["weather"][0]["main"],
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
                          margin: EdgeInsets.symmetric(
                              horizontal: 64, vertical: 16),
                          child: getImage(
                              jsonDecode(currentData)["weather"][0]["id"]),
                        ),
                      ),
                      Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            margin: EdgeInsets.fromLTRB(16, 40, 32, 8),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  'Sunrise : ${jsonDecode(currentData)["sys"]["sunrise"]}',
                                  style: sunPositioningData,
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  'Sunset : ${jsonDecode(currentData)["sys"]["sunset"]}',
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
                            jsonDecode(currentData)["name"],
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
                        currentTemperature: jsonDecode(currentData)["main"]
                            ["temp"],
                        maxTemperature: jsonDecode(currentData)["main"]
                            ["temp_max"],
                        minTemperature: jsonDecode(currentData)["main"]
                            ["temp_min"],
                      ),
                    ],
                  ),
                )
              : SpinKitWave(
                  color: Colors.white,
                  size: 50,
                )),
    );
  }
}
