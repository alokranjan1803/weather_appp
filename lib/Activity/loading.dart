import 'package:flutter/material.dart';
import 'package:weather_app/worker/workers.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({required Key key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String city = "London";
  late String temp;
  late String humidity;
  late String airspeed;
  late String description;
  late String main;
  late String icon;

  void startApp(String city) async {
    Worker inst = Worker(location: city);
    await inst.getData();

    temp = inst.temp;
    humidity = inst.humidity;
    airspeed = inst.airspeed;
    description = inst.description;
    main = inst.main;
    icon = inst.icon;
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        "temp_value": temp,
        "humidity_value": humidity,
        "airspeed_value": airspeed,
        "description_value": description,
        "main_value": main,
        "icon_value": icon,
        "city_value": city,
      });
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic>? search =
    ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    if (search != null && search.isNotEmpty) {
      city = search['searchText'];
    }

    startApp(city);

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Image.asset("images/weather-app.png"),
              ),
              const Text(
                "Weather App",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Made By Alok Ranjan",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 25,
              ),
              const SpinKitWave(
                color: Colors.white,
                size: 50.0,
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.blue[200],
    );
  }
}
