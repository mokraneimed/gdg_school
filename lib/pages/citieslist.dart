// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:gdg_school/pages/secondrouter.dart';
import 'package:lottie/lottie.dart';

class City extends StatelessWidget {
  String cityName;
  double temp;
  double max;
  double min;
  String icon;
  City(
      {super.key,
      required this.cityName,
      required this.temp,
      required this.max,
      required this.min,
      required this.icon});

  String getWeatherCondition(String? maincondition) {
    // if (maincondition == null) return "assets/sunny.json";
    switch (maincondition?.toLowerCase()) {
      case "clouds":
        return "assets/windy.json";
      case "rain":
        return "assets/rainy.json";
      case "clear":
        return "assets/sunny.json";
      case "thunderstorm":
        return "assets/windy_sun.json";
      default:
        return "assets/windy.json";
    }
  }

  @override
  Widget build(BuildContext context) {
    temp = temp.round() - 273;
    return Column(children: [
      ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromRGBO(228, 236, 252, 0.85),
              foregroundColor: const Color.fromRGBO(74, 90, 129, 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: const BorderSide(
                      color: Color.fromRGBO(
                          228, 236, 252, 1.0)))) // Background color
          ,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SecondRoute(
                  cityName: cityName,
                  temp: temp,
                  max: max,
                  min: min,
                  // icon: icon,
                  icon: getWeatherCondition(icon),
                ),
              ),
            );
          },
          child: SizedBox(
              height: 90,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Lottie.asset(
                          getWeatherCondition(
                              icon), // Ensure this returns a valid Lottie file path
                          height: 70, // Adjust size as needed
                        ),
                        Padding(
                            padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cityName,
                                  style: const TextStyle(
                                    color: Color.fromRGBO(74, 90, 129, 10),
                                    fontSize: 20,
                                    fontFamily: 'Schyler',
                                  ),
                                ),
                                Text(
                                  cityName,
                                  style: const TextStyle(
                                    color: Color.fromRGBO(74, 90, 129, 10),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: 'Schyler',
                                  ),
                                )
                              ],
                            )),
                      ],
                    ),
                    Text(
                      '$temp',
                      style: const TextStyle(
                        color: Color.fromRGBO(74, 90, 129, 10),
                        fontSize: 20,
                        fontFamily: 'Schyler',
                      ),
                    )
                  ]))),
      const SizedBox(height: 10)
    ]);
  }
}
