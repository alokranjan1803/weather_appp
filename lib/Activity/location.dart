import 'package:flutter/material.dart';


class Location extends StatefulWidget {
  const Location({required Key key}) : super(key: key);

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Location Activity"),
    );
  }
}
