import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class SecondRoute extends StatelessWidget {
  String cityName;
  double temp;
  double max;
  double min;
  String icon;
  SecondRoute(
      {super.key,
      required this.cityName,
      required this.temp,
      required this.max,
      required this.min,
      required this.icon});

  String getWeatherCondition(String? maincondition) {
    if (maincondition == null) return "assets/sunny.json";
    switch (maincondition) {
      case "Clouds":
        return "assets/windy.json";
      case "Rain":
        return "assets/rainy.json";
      case "Clear":
        return "assets/sunny.json";
      case "thunderstorm":
        return "assets/windy_sun.json";
      default:
        return "assets/sunny.json";
    }
  }

  @override
  Widget build(BuildContext context) {
    min = min;
    max = max;
    String animationPath = getWeatherCondition(icon);
    // temp = temp.round() - 273;
    return Scaffold(
        backgroundColor: const Color.fromRGBO(236, 244, 252, 1.0),
        appBar: AppBar(
            elevation: 0.0,
            backgroundColor: const Color.fromRGBO(236, 244, 252, 1.0),
            toolbarHeight: 100,
            actions: [
              Row(children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(20, 15, 115, 0),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          'Weather',
                          style: TextStyle(
                            fontSize: 30,
                            color: Color.fromRGBO(74, 90, 129, 10),
                            fontFamily: 'Schyler',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ]),
        body: Column(children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            cityName,
            style: const TextStyle(
              fontSize: 25,
              color: Colors.black,
              fontFamily: 'Schyler',
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Lottie.asset(
            animationPath,
            height: 120, // Adjust size as needed
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            '$temp°C',
            style: const TextStyle(
                fontSize: 50,
                fontFamily: 'Schyler',
                color: Color.fromRGBO(74, 90, 129, 10)),
          ),
          const SizedBox(
            height: 80,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '$min',
                        style: const TextStyle(
                          fontSize: 25,
                          color: Color.fromRGBO(74, 90, 129, 10),
                          fontWeight: FontWeight.w200,
                          fontFamily: 'Schyler',
                        ),
                      ),
                      const Text(
                        'min temp',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromRGBO(74, 90, 129, 10),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Schyler',
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '$max',
                        style: const TextStyle(
                          fontSize: 25,
                          color: Color.fromRGBO(74, 90, 129, 10),
                          fontWeight: FontWeight.w200,
                          fontFamily: 'Schyler',
                        ),
                      ),
                      const Text(
                        'max temp',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromRGBO(74, 90, 129, 10),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Schyler',
                        ),
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "$temp %",
                        style: const TextStyle(
                          fontSize: 25,
                          color: Color.fromRGBO(74, 90, 129, 10),
                          fontWeight: FontWeight.w200,
                          fontFamily: 'Schyler',
                        ),
                      ),
                      const Text(
                        'humidity',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromRGBO(74, 90, 129, 10),
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Schyler',
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          )
        ]));
  }
}
