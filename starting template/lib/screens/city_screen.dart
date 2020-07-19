import 'package:flutter/cupertino.dart';
import '../constants.dart';
import 'package:flutter/material.dart';

class CityPage extends StatefulWidget {
  @override
  _CityPageState createState() => _CityPageState();
}

class _CityPageState extends State<CityPage> {
  String typedData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff878787),
      body: Container(
        padding: EdgeInsets.only(top: 15),
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: NetworkImage(
                "https://cdn.pixabay.com/photo/2019/09/22/16/20/location-4496459_960_720.png"),
          ),
        ),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.all(15),
                decoration: backButton,
                child: FlatButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 20,
                    )),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Enter the name of the city",
                    hintStyle:
                        TextStyle(color: Colors.grey, fontFamily: "SourceSans"),
                    icon: Icon(
                      Icons.location_city,
                      color: Colors.white,
                      size: 45,
                    )),
                onChanged: (value) {
                  typedData = value;
                  print(value);
                },
              ),
            ),
            FlatButton(
              onPressed: () {
                Navigator.pop(context, typedData);
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                decoration: BoxDecoration(
                  color: Colors.red[100],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  "Search",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
