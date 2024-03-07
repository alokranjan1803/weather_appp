import 'package:flutter/material.dart';
import 'package:weather_app/Activity/home.dart';
import 'package:weather_app/Activity/loading.dart';

void main() {
  runApp(MaterialApp(
    routes: {
      '/': (BuildContext context) => Loading(key: UniqueKey()),
      '/home': (BuildContext context) => Home(key: UniqueKey()),
      '/loading': (BuildContext context) => Loading(key: UniqueKey()),
    },
    debugShowCheckedModeBanner: false,
  ));
}
