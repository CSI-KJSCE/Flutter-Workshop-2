import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:startingtemplate/screens/city_screen.dart';
import '../widgets/temperature_tile.dart';

TextStyle sunPosition = TextStyle(
  color: Colors.white,
  fontFamily: "SourceSans",
  fontSize: 15,
);

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String typedData;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue[100],
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(
                    Icons.location_on,
                    color: Colors.white,
                    size: 30,
                  ),
                  FlatButton(
                    onPressed: () async {
                      typedData = await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          return CityPage();
                        }),
                      );
                    },
                    child: Icon(
                      Icons.location_searching,
                      color: Colors.white,
                      size: 30,
                    ),
                  )
                ],
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Text("Sunny",
                          style: TextStyle(
                            fontSize: 50,
                            color: Colors.white,
                            fontFamily: "SourceSans",
                          )))),
              Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 64, vertical: 16),
                    child: Icon(
                      Icons.cloud_queue,
                      color: Colors.white,
                      size: 150,
                    ),
                  )),
              Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(16, 40, 32, 8),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "sunrise: 0630 hours",
                          style: sunPosition,
                        ),
                        Text(
                          "sunset: 1930 hours",
                          style: sunPosition,
                        )
                      ],
                    ),
                  )),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                child: Text("Mumbai",
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                      fontFamily: "SourceSans",
                    )),
              ),
              DisplayTemperature(),
            ],
          ),
        )),
      ),
    );
  }
}
