import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';


class Worker {
  late String location;
  late String temp;
  late String humidity;
  late String airspeed;
  late String description;
  late String main;
  late String icon;

  Worker({required this.location});

  Future<void> getData() async {
    try {
      Response response = await get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=<Your Api>"));
      Map<String, dynamic> data = jsonDecode(response.body);

      if (kDebugMode) {
        print(data);
      }

      // Getting temp
      Map<String, dynamic> tempData = data['main'];
      String getHumidity = tempData['humidity'].toString();
      double getTemp = tempData['temp'] - 273.15;

      // Getting air speed
      Map<String, dynamic> wind = data['wind'];
      double getAirSpeed = wind['speed'] / 0.27777777777778;

      // Getting description
      List<dynamic> weatherData = data['weather'];
      Map<String, dynamic> weatherMainData = weatherData[0];

      String getMainDesc = weatherMainData['main'];
      String getDesc = weatherMainData['description'];
      String getIcon = weatherMainData['icon'];

      // Assigning values
      temp = getTemp.toStringAsFixed(2);
      humidity = getHumidity;
      airspeed = getAirSpeed.toStringAsFixed(2);
      description = getDesc;
      main = getMainDesc;
      icon = getIcon;
    } catch (e) {
      temp = "NA";
      humidity = "NA";
      airspeed = "NA";
      description = "Can't Find Data";
      main = "NA";
      icon = "09d";
    }
  }
}
