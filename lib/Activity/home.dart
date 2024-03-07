import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';


class Home extends StatefulWidget {
  const Home({required Key key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if (kDebugMode) {
      print("This is a init state");
    }
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
    if (kDebugMode) {
      print("Set state called");
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    if (kDebugMode) {
      print("Widget Destroyed");
    }
  }

  @override
  Widget build(BuildContext context) {
    var cityName = [
      "Mumbai",
      "Chennai",
      "Delhi",
      "Kolkata",
      "Bangalore",
      "Surat",
      "Jaipur"
    ];
    final random = Random();
    var city = cityName[random.nextInt(cityName.length)];

    Map<String, dynamic> info = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    String temp = ((info['temp_value']).toString());
    String air = ((info['airspeed_value']).toString());

    if(temp == "NA"){
      if (kDebugMode) {
        print("NA");
      }
    }
    else{
       temp = ((info['temp_value']).toString()).substring(0,4);
       air = ((info['airspeed_value']).toString()).substring(0,4);
    }

    String geticon = info['icon_value'];
    String getcity = info['city_value'];
    String humidity = info['humidity_value'];
        String desc = info['description_value'] as String;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      //colour the status bar
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.blue,
        ),
      ),


      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(0),
      //   child: GradientAppBar(
      //     gradient: LinearGradient(
      //       colors: [
      //         Colors.cyan,
      //         Colors.blue,
      //       ]
      //     ),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [
                  0.1,
                  0.5,
                  0.9
                ],
                    colors: [
                  Colors.blue,
                  Colors.lightBlue,
                  Colors.lightBlueAccent,
                ])),
            child: Column(

              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          if((searchController.text).replaceAll(" ", "") == ""){
                            if (kDebugMode) {
                              print("Blank Search");
                            }
                          }else{
                            Navigator.pushReplacementNamed(context, "/loading", arguments: {
                              "searchText": searchController.text,
                            });
                          }

                        },
                        child: Container(

                          padding: const EdgeInsets.fromLTRB(2, 0, 5, 0),

                          child: const Icon(
                            Icons.search,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ),
                      Expanded(
                        child: TextField(
                          controller: searchController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search $city",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [

                    Expanded(

                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        padding: const EdgeInsets.all(10),

                        child: Row(
                          children: [

                            Image.network("https://openweathermap.org/img/wn/$geticon@2x.png"),
                            const SizedBox(width: 15,),
                            Column(
                              children: [
                                Text(desc,style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),),
                                Text(" In $getcity",style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        margin:
                            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        padding: const EdgeInsets.all(25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(WeatherIcons.thermometer),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(temp, style: const TextStyle(fontSize: 80),),
                                const Text("C", style: TextStyle(fontSize: 60),),
                              ],
                            )
                          ],

                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Container(
                        height: 175,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        margin: const EdgeInsets.fromLTRB(20, 0, 10, 0),
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(WeatherIcons.day_windy),
                              ],
                            ),
                            const SizedBox(height: 15,),

                            Text(air, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                            const Text("Km/hr", style: TextStyle(fontSize: 20),),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 175,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white.withOpacity(0.5),
                        ),
                        margin: const EdgeInsets.fromLTRB(10, 0, 20, 0),
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          children: [
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(WeatherIcons.humidity),
                              ],
                            ),
                            const SizedBox(height: 15,),

                            Text(humidity, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                            const Text("Percent", style: TextStyle(fontSize: 20),),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 95,),
                Container(
                  padding: const EdgeInsets.all(30),

                  child: const Column(

                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                      Text("Made By Alok Ranjan"),
                      Text("Data Provided By Openweathermap.org"),
                    ],
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
