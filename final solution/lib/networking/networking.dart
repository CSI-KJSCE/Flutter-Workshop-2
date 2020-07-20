import 'dart:convert';
import 'package:http/http.dart';

//TODO: add your own api key
String apiKey = "";

Future<dynamic> getCurrentData({double lat, double long}) async {
  Response response = await get(
      "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$apiKey&units=metric");
  String data = response.body;
  return data;
}

Future<dynamic> getCityData(String cityName, double long, double lat) async {
  Response response = await get(
      "https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric");
  String data = response.body;
  if (jsonDecode(data)["cod"] == 200) {
    return data;
  } else {
    return getCurrentData(lat: lat, long: long);
  }
}
